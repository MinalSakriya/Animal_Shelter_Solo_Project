require('minitest/autorun')
require('minitest/rg')
require_relative('../models/animal.rb')

class AnimalTest < MiniTest::Test

  def setup()

    animal1 = ({
      'id' => '1',
      'name' => 'Archie',
      'breed' => 'Labrador',
      'type' => 'Dog',
      'admission_date' => '10.06.2018',
      'adoptable' => 'Yes'
      })

    animal2 = ({
      'id' => '2',
      'name' => 'Tom',
      'breed' => 'Cocker Spaniel',
      'type' => 'Dog',
      'admission_date' => '17.07.2018',
      'adoptable' => 'Yes'
      })

    animal3 = ({
      'id' => '3',
      'name' => 'Davy',
      'breed' => "Tammy",
      'type' => 'Cat",
      'admission_date' => '19.09.2018',
      'adoptable' => 'No'
      })
      @animal1 = Animal.new(animal1)
      @animal2 = Animal.new(animal2)
      @animal3 = Animal.new(animal3)
  end

  def test_name()
    assert_equal("Archie", @animal1.name )
  end

  def test_breed()
    assert_equal("Labrador", @animal.breed)
  end

  def test_type()
    assert_equal("Dog", @animal3.type)
  end


end
