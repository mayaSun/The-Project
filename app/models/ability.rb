class Ability
  include CanCan::Ability

  def initialize(broker_or_admin)
    broker_or_admin ||= Broker.new

    common_rules(broker_or_admin)

    if broker_or_admin.kind_of? Admin 
      admin_rules(broker_or_admin)
    else
      broker_rules(broker_or_admin)
    end
  end

  def common_rules(broker_or_admin)
    # can :verb, :noun
  end

  def admin_rules(admin)
    can :access, :rails_admin 
    can :manage, Broker
    
    if(admin.role == 'superadmin') 
      can :manage, Country
      can :manage, Lead
      can :manage, Site
      can :manage, Language
      can :manage, Lead
    else
      can :read, Country
      can :read, Lead
      can :read, Site
      can :read, Language
      can :read, Lead
    end
    
    
  end

  def broker_rules(broker)
    can :read, :all
  end
end

