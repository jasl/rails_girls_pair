class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all

    user ||= User.new

    can :read, :all

    if user.admin?
      # rails admin
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard

      can :manage, :all
    elsif user.persisted?
      can :attend, Event
    else

    end
  end
end
