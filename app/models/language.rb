# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string
#

class Language <ActiveRecord::Base

  validates_presence_of :name

  has_many :brokers_languages
  has_many :brokers , through: :brokers_languages

  has_many :languages_sites
  has_many :sites , through: :languages_sites

  has_many :leads

  rails_admin do
    list do
      filters [:name]
      fields :name
      field :brokers do
        label 'Brokers'
        pretty_value do
          bindings[:view].link_to(bindings[:object].brokers.count, nil)#admin_lead_path())
        end
      end

      field :sites do
        label 'Sites'
        pretty_value do
          bindings[:view].link_to(bindings[:object].sites.count, nil)#admin_lead_path())
        end
      end

      field :leads do
        label 'Leads'
        pretty_value do
          bindings[:view].link_to(bindings[:object].leads.count, nil)#admin_lead_path())
        end
      end
    end

    edit do
      fields :name, :brokers, :sites
    end

    show do
      fields :name, :brokers, :sites, :leads
    end
  end

end