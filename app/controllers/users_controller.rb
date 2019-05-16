class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    @events = Event.where(user_id: @user.id)
  end

end
