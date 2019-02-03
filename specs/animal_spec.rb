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
      @animal1 = Animal.new(animal1)
  end


  def test_name()
    assert_equal("Archie", @animal1.name )
  end

  def test_breed()
    assert_equal("Labrador", @animal1.breed)
  end

  def test_type()
    assert_equal("Dog", @animal1.type)
  end


end
