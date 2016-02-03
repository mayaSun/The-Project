# == Schema Information
#
# Table name: brokers_languages
#
#  id          :integer          not null, primary key
#  language_id :integer
#  broker_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class BrokersLanguage <ActiveRecord::Base
  belongs_to :broker
  belongs_to :language
end


