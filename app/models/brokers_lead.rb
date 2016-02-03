# == Schema Information
#
# Table name: brokers_leads
#
#  id         :integer          not null, primary key
#  broker_id  :integer
#  lead_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class BrokersLead <ActiveRecord::Base
  belongs_to :broker
  belongs_to :lead
  
  has_many :deposits
end
