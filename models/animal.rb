require_relative('./owner.rb')
require_relative('../db/sql_runner.rb')


class Animal

  attr_reader :id
  attr_accessor :name, :breed, :type, :admission_date, :owner_id, :adoptable

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @breed = options['breed']
    @type = options['type']
    @admission_date = options['admission_date']
    @adoptable = options['adoptable']
    @owner_id = options['owner_id'].to_i if options['owner_id']
  end

# This is to CREATE all the animals in the database.
  def save()
    sql = "INSERT INTO animals (name, breed, type, admission_date, adoptable, owner_id) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @breed, @type, @admission_date, @adoptable, @owner_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE animals SET (name, breed, type, admission_date, adoptable, owner_id) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @breed, @type, @admission_date, @adoptable, @owner_id, @id]
    SqlRunner.run(sql, values)
  end


  # This will give list of all the aniamls with their admission date.
  def self.all()
    sql = "SELECT * FROM animals ORDER BY name ASC"
    all_animals = SqlRunner.run(sql)
    return all_animals.map{ |animal| Animal.new(animal)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Animal.new(result.first)
  end


  def update_adoptable()
    sql = "UPDATE animals SET adoptable = $1 WHERE id = $2"
    values = [@adoptable, @id]
    SqlRunner.run(sql, values)
  end

  def assign_animal_to_owner()
    sql = "UPDATE animals SET owner_id = $1 WHERE id = $2"
    values = [@owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all_unadopted_adoptable_animals()
    sql = "SELECT * FROM animals WHERE adoptable = 't' AND owner_id IS NULL ORDER BY name ASC"
    all_unadopted_adoptable_animals = SqlRunner.run(sql)
    return all_unadopted_adoptable_animals.map{ |animal| Animal.new(animal)}
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_by_breed(breed)
    sql = "SELECT * FROM animals WHERE breed = $1"
    values = [breed]
    breed_hash = SqlRunner.run(sql, values)
    result = Animal.new(breed_hash.first)
    return result
  end

  def self.find_by_type(type)
    sql = "SELECT * FROM animals WHERE type = $1"
    values = [type]
    type_hash = SqlRunner.run(sql, values)
    result = Animal.new(type_hash.first)
    return result
  end



end
