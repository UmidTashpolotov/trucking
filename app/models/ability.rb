class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.customer?
      can :read, Offer
      can :accept, Offer
      can :reject, Offer
      can :read, Order do |order|
        order.user == user
      end
      can :create, Order
      can :close, Order do |order|
        order.user == user
        order.status == 'open'
      end
      can :complete, Order do |order|
        order.user == user
        order.status == 'in_progress'
      end
      can :destroy, Order do |order|
        order.user == user
      end
    elsif user.worker?
      can :read, Order
      can :create, Offer
      can :update, Offer do |offer|
        offer.user == user
      end
      can :destroy, Offer do |offer|
        offer.user == user
      end

    else
      can :read, Order
    end
  end
end
