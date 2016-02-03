# == Schema Information
#
# Table name: brokers_countries
#
#  id          :integer          not null, primary key
#  country_id  :integer
#  broker_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class BrokersCountry <ActiveRecord::Base
  belongs_to :broker
  belongs_to :country
end