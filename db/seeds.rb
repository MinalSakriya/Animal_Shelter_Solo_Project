require_relative('../models/animal.rb')
require_relative('../models/owner.rb')

require ('pry')

Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({
  'first_name' => 'Sam',
  'last_name' => 'Mitchell'
  })
  owner1.save()

owner2 = Owner.new({
  'first_name' => 'Ben',
  'last_name' => 'Kerr'
  })
  owner2.save()

owner3 = Owner.new({
  'first_name' => 'Kevin',
  'last_name' => 'Boyd'
  })
 owner3.save()

 owner4 = Owner.new({
   'first_name' => 'Zoe',
   'last_name' => 'Potter'
   })
  owner4.save()

  owner5 = Owner.new({
    'first_name' => 'Lee',
    'last_name' => 'Smith'
    })
   owner5.save()


animal1 = Animal.new({
    'name' => 'Archie',
    'breed' => 'Labrador',
    'type' => 'Dog',
    'admission_date' => '10.06.2018',
    'adoptable' => 'Yes',
    'owner_id' => owner1.id
    })
  animal1.save()

animal2 = Animal.new({
    'name' => 'Tommy',
    'breed' => 'Cocker Spaniel',
    'type' => 'Dog',
    'admission_date' => '17.07.2018',
    'adoptable' => 'Yes',
    'owner_id' => owner2.id
    })
  animal2.save()

animal3 = Animal.new({
    'name' => 'Fluffy',
    'breed' => 'Ragdoll',
    'type' => 'Cat',
    'admission_date' => '19.09.2018',
    'adoptable' => 'No'

    })
  animal3.save()

animal4 = Animal.new({
    'name' => 'Fido',
    'breed' => 'American Shorthair',
    'type' => 'Cat',
    'admission_date' => '1.02.2018',
    'adoptable' => 'No'

    })
  animal4.save()

animal5 = Animal.new({
    'name' => 'Percy',
    'breed' => 'Berkshire',
    'type' => 'Pig',
    'admission_date' => '24.02.2018',
    'adoptable' => 'Yes'

    })
  animal5.save()

  animal6 = Animal.new({
      'name' => 'Daisy',
      'breed' => 'Jersey Cattle',
      'type' => 'Cow',
      'admission_date' => '24.02.2018',
      'adoptable' => 'Yes'

      })
    animal6.save()

  animal7 = Animal.new({
      'name' => 'Alfie',
      'breed' => 'Highland',
      'type' => 'Horse',
      'admission_date' => '20.02.2018',
      'adoptable' => 'Yes',
      'owner_id' => owner2.id
      })
    animal7.save()

    animal8 = Animal.new({
        'name' => 'Mali',
        'breed' => 'Higland',
        'type' => 'Goat',
        'admission_date' => '30.03.2018',
        'adoptable' => 'Yes'
        })
      animal8.save()
      animal8.adoptable = "No"
      animal8.update_adoptable()

    animal9 = Animal.new({
          'name' => 'Slither',
          'breed' => 'Rattle',
          'type' => 'Snake',
          'admission_date' => '10.03.2018',
          'adoptable' => 'Yes'
          })
      animal9.save()
      animal9.owner_id = owner3.id
      animal9.assign_animal_to_owner()






binding.pry
nil
