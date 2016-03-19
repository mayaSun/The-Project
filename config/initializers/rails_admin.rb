RailsAdmin.config do |config|

  config.main_app_name = ['The Application', 'BackOffice']
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method { current_admin }
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Admin', 'User']
  config.included_models = ['Lead', 'Broker', 'BrokersLead', 'Site', 'Country', 'Language']
  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  PROTECTED_MODELS = []
  NO_NEW = ['Lead']
  NO_EDIT = NO_NEW - ['Lead']
  NO_DELETE = [*PROTECTED_MODELS]
  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new do
      except NO_NEW
    end
    export
    history_index
    bulk_delete
    # member actions
    show
    edit do
      except NO_EDIT
    end
    delete do
      authorized do
        !(bindings[:object].respond_to?(:prevent_destroy?) && bindings[:object].prevent_destroy?) &&
          ! NO_DELETE.include?(bindings[:abstract_model].model_name)
      end
    end
    history_show
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.models do
    edit do
      fields do
        visible do
          visible && !read_only
        end
      end
    end
  end unless 'test' == Rails.env

  config.model 'Lead' do
    weight 0
  end

  config.model 'BrokersLead' do
    parent Lead
    label 'Brokers Leads' 
  end

  config.model 'Broker' do
    weight 1
  end

  config.model 'Site' do
    weight 2
  end

  config.model 'Country' do
    weight 3
  end

  config.model 'Language' do
    weight 4
  end
  
end
