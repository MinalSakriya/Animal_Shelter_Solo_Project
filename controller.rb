require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/animal.rb')
require_relative('./models/owner.rb')
also_reload('./models/*')

# Index
get '/animalshelter/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/animalshelter/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end
