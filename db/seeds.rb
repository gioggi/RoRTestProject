# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
team = Team.create!({:name => "Denver"})
Worker.create!({:name => "The boss (CEO)", :email => "boss@cep.pro", :role => 2})
Worker.create!({:name => "Mario Rossi", :email => "email@programmer.pro", :role => 0, :team => team})
Worker.create!({:name => "Mario Verdi", :email => "email@programmer.pro", :role => 0, :team => team})
Worker.create!({:name => "Project Manager", :email => "email@pm.pro", :role => 1, :team => team})
