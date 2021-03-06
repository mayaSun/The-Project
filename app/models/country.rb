# == Schema Information
#
# Table name: countries
#
#  id                 :integer          not null, primary key
#  name               :string
#  code               :string
#  phone_country_code :string
#  rate               :string
# 

class Country <ActiveRecord::Base

  validates_presence_of :code

  has_many :brokers_countries
  has_many :brokers , through: :brokers_countries

  has_many :leads

  before_validation :set_country_attributes

  def set_country_attributes
    country = nil
    if !code.nil? && !code.empty?
      country = ISO3166::Country.new(code)
    elsif !name.nil? && !name.empty?
      country = ISO3166::Country.find_country_by_name(name)
    end
    unless country.nil?
      self.code = country.alpha2 
      self.name = country.name 
      self.phone_country_code = country.country_code
    end
  end

  c = ISO3166::Country.new('US')

  rails_admin do
    list do
      filters [:name, :code, :phone_country_code, :rate]
      fields :name, :code, :phone_country_code, :rate
      field :brokers do
        label 'Brokers'
        pretty_value do
          bindings[:view].link_to(bindings[:object].brokers.count, nil)#admin_lead_path())
        end
      end
    end

    edit do
      fields :name, :code, :rate, :phone_country_code
    end

    show do
      fields :name, :code, :rate, :phone_country_code
    end
  end
end

