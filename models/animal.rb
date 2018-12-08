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
    @admission_date = options['admission_date'].to_i
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

# This will give list of all the aniamls with their admission date.
  def self.all()
    sql = "SELECT * FROM animals"
    all_animals = SqlRunner.run(sql)
    return all_animals.map{ |animal| Animal.new(animal)}
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

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end




end
