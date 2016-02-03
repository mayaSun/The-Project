# == Schema Information
#
# Table name: brokers_campaings
#
#  id          :integer          not null, primary key
#  broker_id   :integer
#  campaing_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class BrokersCampaign <ActiveRecord::Base
  belongs_to :broker
  belongs_to :campaign
end

