class UsersController < ApplicationController
  def show
    @user = current_user
    @events = Event.where(user_id: @user.id)
  end

  def edit
  end

  def update
  end
end
