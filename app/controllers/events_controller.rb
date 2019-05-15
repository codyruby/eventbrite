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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    p params.require(:event).permit(:start_date, :duration, :description, :title, :price, :location)
  end

end
