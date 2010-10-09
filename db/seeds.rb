# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts "Creando MBAs"
mba = Mba.create([
  {:name => 'MBA G 24'},
  {:name => 'MBA G 25'},
  {:name => 'MBA G 26'},
  {:name => 'MBA G 27'}]
)

puts "Creando Niveles"
levels = Level.create([
  {:name => "Independiente / Asesor / Consultor"},
  {:name => "Director / Empresario"},
  {:name => "Gerencia General"},
  {:name  => "Gerencia de área"},
  {:name  => "Jefatura de área / supervisor"},
  {:name  => "Asistente"},
  {:name  => "Otro"}] 
)

puts "Creando Funciones"
functions = Function.create([
  {:name => "Consultoría o asesoría empresarial"},
  {:name  => "Directorio o gobierno corporativo"},
  {:name => "Gerencia general"},
  {:name => "Administración"},
  {:name  => "Contabilidad"},
  {:name => "Finanzas"},
  {:name => "Comercial y ventas"},
  {:name => "Marketing"},
  {:name => "Operaciones"},
  {:name => "Sistemas y tecnología"},
  {:name => "Investigación y desarrollo"},
  {:name => "Legal"},
  {:name => "Otro"}]
)

puts "Creando trabajos"
works = Work.create([
  {:name => "Independiente / Freelance"},
  {:name => "Libre y Sabático"}]
)

puts "Creando usuarios"
users = User.create([
  {:email=>"ccastillop@gmail.com",:role=>"admin",
    :password=>"lima1234",:password_confirm=>"lima1234"},
  {:email=>"user@gmail.com",:role=>"user",
    :password=>"lima1234",:password_confirm=>"lima1234"},
  {:email=>"user2@gmail.com",
    :password=>"lima1234",:password_confirm=>"lima1234"}
    ]
)