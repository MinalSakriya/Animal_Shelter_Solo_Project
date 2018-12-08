require_relative('./animal.rb')
require_relative('../db/sql_runner.rb')

class Owner

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE owners SET (first_name, last_name) = ($1, $2) WHERE id = $3"
    values = [@first_name, @last_name, @id]
    result = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    all_owners = SqlRunner.run(sql)
    return all_owners.map{ |owner| Owner.new(owner)}
  end


  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Owner.new(result.first)
  end

  def adopted_animals()
    sql = "SELECT * FROM animals WHERE owner_id = $1"
    values = [@id]
    adopted_animals = SqlRunner.run(sql,values)
    return adopted_animals.map{ |animal| Animal.new(animal)}
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
