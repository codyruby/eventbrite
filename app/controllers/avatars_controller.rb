class AvatarsController < ApplicationController
  def create
    @event = Event.find_by(user_id: current_user.id)
    @event.avatar.attach(params[:avatar])
    redirect_to(event_path(@event))
  end
end
