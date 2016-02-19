# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Admin.create(email: 'maya166@gmail.com', password: 'mayaadmin', role: 'superadmin')
Admin.create(email: 'ng-forex@hotmail.com', password: 'niradmin', role: 'superadmin')

Country.create(code: 'IL')
Country.create(code: 'US')
Country.create(code: 'UK')
Country.create(code: 'SG')
Country.create(code: 'AL')
Country.create(code: 'AU')


Language.create(name: 'English')
Language.create(name: 'Arabic')
Language.create(name: 'Spanish')
Language.create(name: 'Franch')

Site.create(name: 'The Forex Site', url: 'https://www.optionrally.com/')
Site.create(name: 'Make Money', url: 'https://www.optionrally.com/')
Site.create(name: 'Master Forex', url: 'https://www.optionrally.com/')


Broker.create(name: 'Avi Shlomo', email: 'avi@gmail.com', password: 'thebroker', leads_per_day: 50, :country_ids => [1,2], :lead_ids => [])
Broker.create(name: 'Amy Winehouse', email: 'amy@gmail.com', password: 'thebroker', leads_per_day: 30, :country_ids => [1,5], :lead_ids => [])

50.times { 
  lead = Lead.create(name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, country: Country.find_by(code: 'IL'), site: Site.find_by_name('The Forex Site') )
  lead.update_attributes(site_id: 3, language_id: 1)
  Broker.find_by_email('amy@gmail.com').brokers_leads.create(lead: lead) 
  lead = Lead.create(name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, country: Country.find_by(code: 'UK'), site: Site.find_by_name('Make Money') )
  lead.update_attributes(site_id: 2, language_id: 1) 
  Broker.find_by_email('avi@gmail.com').brokers_leads.create(lead: lead)
  lead = Lead.create(name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, country: Country.find_by(code: 'US'), site: Site.find_by_name('Make Money') )
  lead.update_attributes(site_id: 1, language_id: 2) 
  Broker.find_by_email('avi@gmail.com').brokers_leads.create(lead: lead)
  lead = Lead.create(name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, country: Country.find_by(code: 'SG'), site: Site.find_by_name('Master Forex') )
  lead.update_attributes(site_id: 1, language_id: 2) 
  Broker.find_by_email('avi@gmail.com').brokers_leads.create(lead: lead)
}
