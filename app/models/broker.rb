# == Schema Information
#
# Table name: brokers
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string
#  leads_per_day          :integer
#  password_digest        :string
#  reset_password_token   :string
#  reset_password_sent_at :string
#  slug                   :string
#  created_at             :datetime
#  updated_at             :datetime
#

class Broker <ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  include Sluggable
  sluggable_column :name

  validates_presence_of :email, :name, :password 

  has_many :brokers_campaigns
  has_many :campaigns , through: :brokers_campaigns

  has_many :brokers_countries
  has_many :countries , through: :brokers_countries

  has_many :brokers_leads
  has_many :leads , through: :brokers_leads

  has_many :brokers_languages
  has_many :languages , through: :brokers_languages

  rails_admin do
    list do
      filters [:name, :email, :leads_per_day, :created_at]
      fields :id, :name, :email, :leads_per_day, :created_at, :countries
      field :leads do
        label 'All Leads'
        pretty_value do
          bindings[:view].link_to(bindings[:object].leads.count, nil)#admin_lead_path())
        end
      end
    end

    edit do
      fields :name, :email, :leads_per_day, :countries
    end

    show do
      field :id
      field :name
      field :email
      field :leads_per_day
      field :countries
      field :languages
      field :campaigns 
    end

    configure :brokers_countries do
      visible(false)
    end

    configure :countries do
      orderable(true) # only for multiselect widget currently. Will add the possibility to order blocks
      # configuration here
    end
  end

end



