require_relative('../models/animal.rb')
require_relative('../models/owner.rb')

require ('pry')

# Animal.delete_all()
# Owner.delete_all()

owner1 = Owner.new({
  'id' => 1,
  'first_name' => 'Sam',
  'last_name' => 'Mitchell'
  })
  owner1.save()

owner2 = Owner.new({
  'id' => 2,
  'first_name' => 'Ben',
  'last_name' => 'Kerr'
  })
  owner2.save()

owner3 = Owner.new({
  'id' => 3,
  'first_name' => 'Kevin',
  'last_name' => 'Boyd'
  })
 owner3.save()


animal1 = Animal.new({
    'id' => 1,
    'name' => 'Archie',
    'breed' => 'Labrador',
    'type' => 'Dog',
    'admission_date' => '10.06.2018',
    'adoptable' => 'Yes',
    'owner_id' => owner1.id
    })
  animal1.save()

animal2 = Animal.new({
    'id' => 2,
    'name' => 'Tom',
    'breed' => 'Cocker Spaniel',
    'type' => 'Dog',
    'admission_date' => '17.07.2018',
    'adoptable' => 'Yes',
    'owner_id' => owner2.id
    })
  animal2.save()

animal3 = Animal.new({
    'id' => 3,
    'name' => 'Davy',
    'breed' => 'Tammy',
    'type' => 'Cat',
    'admission_date' => '19.09.2018',
    'adoptable' => 'No',
    'owner_id' => owner3.id
    })
  animal3.save()

binding.pry
nil
