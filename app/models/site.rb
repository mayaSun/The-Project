# == Schema Information
#
# Table name: sites
#
#  id          :integer          not null, primary key
#  name        :string
#  url         :string
#  campaign_id :integer
#  slug        :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Site <ActiveRecord::Base
  include Sluggable
  sluggable_column :name
 
  validates_presence_of :name, :url

  has_many :leads
  has_many :languages_sites
  has_many :languages , through: :languages_sites
 
  belongs_to :campaign

  rails_admin do
    list do
      filters [:name, :campaign, :created_at]
      fields :name, :campaign, :languages, :created_at
      field :leads do
        label 'Leads'
        pretty_value do
          bindings[:view].link_to(bindings[:object].leads.count, nil)#admin_lead_path())
        end
      end
    end

    edit do
      fields :name, :url, :campaign, :languages
    end

    show do
      fields :name, :url, :campaign, :languages
    end
  end

end

   
