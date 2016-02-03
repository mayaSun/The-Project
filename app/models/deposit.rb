# == Schema Information
#
# Table name: deposits
#
#  id               :integer          not null, primary key
#  brokers_lead_id  :integer
#  amount           :integer
#  currency         :string
#  created_at       :datetime
#  updated_at       :datetime
#

class Deposit <ActiveRecord::Base

  validates_presence_of :brokers_lead_id, :amount, :currency 

  belongs_to :brokers_lead
end
