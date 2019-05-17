class ChargesController < ApplicationController
    def new
      @event = Event.find(params[:id])
    end
    
    def create
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @event.price * 100,
        description: 'Rails Stripe customer',
        currency: 'EUR',
      })

      # Création d'une participation d'un user à l'évènement
      @attendance = Attendance.create(stripe_customer_id: customer.id, user: current_user, event: @event)
      redirect_to event_path(event.current_user)
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
