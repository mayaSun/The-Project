# == Schema Information
#
# Table name: countries
#
#  id           :integer          not null, primary key
#  name         :
#  code :string
#  rate         :string
# 

class Country <ActiveRecord::Base

  validates_presence_of :code

  has_many :brokers_countries
  has_many :brokers , through: :brokers_countries

  has_many :leads

  before_save :set_country_name

  def set_country_name
    country = ISO3166::Country.new(self.code)
    self.name = country.name unless country.nil?
  end

  c = ISO3166::Country.new('US')

  rails_admin do
    list do
      filters [:name, :code, :rate]
      fields :name, :code, :rate
      field :brokers do
        label 'Brokers'
        pretty_value do
          bindings[:view].link_to(bindings[:object].brokers.count, nil)#admin_lead_path())
        end
      end
    end

    edit do
      fields :name, :code, :rate
    end

    show do
      fields :name, :code, :rate
    end
  end
end

