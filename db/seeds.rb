# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Admin.create(email: 'maya166@gmail.com', password: 'mayaadmin', role: 'superadmin')
Admin.create(email: 'ng-forex@hotmail.com', password: 'niradmin', role: 'superadmin')

Language.create(name: 'English')
Language.create(name: 'Arabic')
Language.create(name: 'Spanish')
Language.create(name: 'Franch')

Site.create(name: 'The Forex Site', url: 'https://www.optionrally.com/')
Site.create(name: 'Make Money', url: 'https://www.optionrally.com/')
Site.create(name: 'Master Forex', url: 'https://www.optionrally.com/')

Broker.create(name: 'Neal Young', email: 'avi@gmail.com', password: 'thebroker', leads_per_day: 50)
Broker.create(name: 'Amy Winehouse', email: 'amy@gmail.com', password: 'thebroker', leads_per_day: 30)

