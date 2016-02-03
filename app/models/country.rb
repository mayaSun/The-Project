# == Schema Information
#
# Table name: countries
#
#  id           :integer          not null, primary key
#  country_code :string
#  rate         :string
# 

class Country <ActiveRecord::Base

  validates_presence_of :country_code

  has_many :brokers_countries
  has_many :brokers , through: :brokers_countries

  has_many :leads

  rails_admin do
    list do
      filters [:name, :country_code, :rate]
      fields :name, :country_code, :rate
      field :brokers do
        label 'Brokers'
        pretty_value do
          bindings[:view].link_to(bindings[:object].brokers.count, nil)#admin_lead_path())
        end
      end
    end

    edit do
      fields :name, :country_code, :rate
    end

    show do
      fields :name, :country_code, :rate
    end
  end
end

