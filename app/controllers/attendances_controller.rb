class AttendancesController < ApplicationController
  def index
    @event = Event.find(params[:id])
    @users = @event.users
  end

  def new
  end

  def create
  end
end
