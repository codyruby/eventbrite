class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  # Méthode qui permet de créer un nouvel évènement avec les params récupéré dans le formulaire de la vue new de events
  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))
    if @event.save
    
    redirect_to event_path(id: @event.id)
    else
    render 'new'
    end
  end
 
  def subscribe 
    @event = Event.find(params[:id])

    @amount = @event.price * 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'EUR',
    })

    # Création d'une participation d'un user à l'évènement
    @attendance = Attendance.create(stripe_customer_id: customer.id, user: current_user, event: @event)
    
    redirect_to event_path(@event.id)
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @event

  end

  def edit
    @event = Event.find(params[:id]) 
  end

  def update
    @event = Event.find(params[:id])
     if @event.update(event_params) 

      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
		@event.destroy
		redirect_to root_path
  end

  private

  def event_params
     params.require(:event).permit(:start_date, :duration, :description, :title, :price, :location)
  end

end
