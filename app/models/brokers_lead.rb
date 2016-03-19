# == Schema Information
#
# Table name: brokers_leads
#
#  id         :integer          not null, primary key
#  broker_id  :integer
#  lead_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class BrokersLead <ActiveRecord::Base
  belongs_to :broker
  belongs_to :lead
  
  has_many :deposits

  delegate :name, to: :lead
  delegate :email, to: :lead
  delegate :phone, to: :lead
  delegate :ctoption_password, to: :lead
  delegate :language, to: :lead
  delegate :country, to: :lead
  delegate :brokers, to: :lead


  RailsAdmin::Config::Fields::Types::register(:name, String)
  rails_admin do
    
    configure :name do
      pretty_value do
        bindings[:view].link_to bindings[:object].name, RailsAdmin::Engine.routes.url_helpers.show_path(model_name: 'lead', id: bindings[:object].lead_id)
      end
      export_value do
        bindings[:object].name
      end
    end

    configure :email do
      pretty_value do
        bindings[:object].email
      end
    end

    configure :phone do
      pretty_value do
        bindings[:object].phone
      end
    end

    configure :site do
      pretty_value do
        bindings[:object].site
      end
    end

    configure :language do
      pretty_value do
        bindings[:object].language
      end
    end

    configure :country do
      pretty_value do
        bindings[:object].country
      end
    end

    configure :ctoption_password do
      pretty_value do
        bindings[:object].ctoption_password
      end
    end

    configure :brokers do
      pretty_value do
        bindings[:object].brokers.size
      end
    end

    list do
      filters [:broker, :created_at]
      fields :broker, :name, :email, :phone, :created_at
    end

    show do
      fields :name, :email, :ctoption_password, :site, :language, :country, :brokers
    end
  end

end
