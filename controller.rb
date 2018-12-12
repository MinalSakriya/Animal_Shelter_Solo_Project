require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/animal.rb')
require_relative('./models/owner.rb')
also_reload('./models/*')

get '/animalshelter' do
  erb(:home)
end

# Index
get '/animalshelter/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/animalshelter/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end

get '/animalshelter/animal/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

post '/animalshelter/animal/:id' do
  @animals = Animal.new(params)
  @animals.update()
  redirect("/animalshelter/animals")
end

get '/animalshelter/animal/adoption' do
  @animals = Animal.all_unadopted_adoptable_animals()
  @owners = Owner.all()
  erb(:"animals/adoption")
end

post '/animalshelter/animal/adoption/done' do
  @animal = Animal.new(params)
  @animal.assign_animal_to_owner()
  redirect("/animalshelter/owners")
end

get '/animalshelter/animal/new' do
  erb(:"animals/new")
end

post '/animalshelter/animal' do
  @animal = Animal.new(params)
  @animal.save()
  redirect("/animalshelter/animals")
end


get '/animalshelter/owner/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

post '/animalshelter/owner/:id' do
  @owners = Owner.new(params)
  @owners.update()
  redirect("/animalshelter/owners")
end

get '/animalshelter/owner/new' do
  @owner = Owner.all()
  erb(:"owners/new")
end

post '/animalshelter/owner' do
  @owner = Owner.new(params)
  @owner.save()
  redirect("/animalshelter/owners")
end

post '/animalshelter/animal/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete()
  redirect("/animalshelter/animals")
end

post '/animalshelter/owner/:id/delete' do
  owner = Owner.find(params[:id])
  owner.delete()
  redirect('/animalshelter/owners')
end

get '/animalshelter/animal/breed' do
  @animal = Animal.find_by_breed(params[:breed])
  erb(:"animals/search")
end

get '/animalshelter/animal/type' do
  @animal = Animal.find_by_type(params[:type])
  erb(:"animals/search")
end

get '/search' do
  erb(:"animals/search")
end
