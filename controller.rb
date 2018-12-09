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

get '/animalshelter/animal/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

post '/animalshelter/animal/:id' do
  @animals = Animal.new(params)
  @animals.update_adoptable()
  redirect("/animalshelter/animal/#{params[:id]}/edit")
end
