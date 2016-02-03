# == Schema Information
#
# Table name: campaigns
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime
#  updated_at :datetime
#

class Campaign <ActiveRecord::Base
  include Sluggable
  sluggable_column :name

  validates_presence_of :name

  has_many :brokers_campaigns
  has_many :brokers , through: :brokers_campaigns

  has_many :sites

end
