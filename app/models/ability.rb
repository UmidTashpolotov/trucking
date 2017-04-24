class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.customer?
      can :read, Offer
      can :accept, Offer do |offer|
        offer.order.status == 'open'
      end
      can :reject, Offer do |offer|
        offer.order.status == 'in_progress'
      end
      can :read, Order do |order|
        order.user == user
      end
      can :create, Order
      can :close, Order do |order|
        order.user == user and order.status == 'open'
      end
      can :complete, Order do |order|
        order.user == user and order.status == 'in_progress'
      end
      can :destroy, Order do |order|
        order.user == user
      end
      can :comment, Order do |order|
        order.user == user and order.status == 'completed' and !order.has_comment_from(user)
      end
    elsif user.worker?
      can :read, Order
      can :create, Offer
      can :read, Document do |doc|
        doc.user == user
      end
      can :create, Document
      can :update, Document do |doc|
        doc.user == user
      end
      can :update, Offer do |offer|
        offer.user == user and offer.order.status == 'open'
      end
      can :destroy, Offer do |offer|
        offer.user == user and offer.order.status == 'open'
      end
      can :complete, Order do |order|
        order.worker == user and order.status == 'in_progress'
      end
      can :comment, Order do |order|
        order.worker == user and order.status == 'completed' and !order.has_comment_from(user)
      end
    else
      can :read, Order
    end
  end
end
