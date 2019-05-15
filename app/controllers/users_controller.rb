class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    @events = Event.where(user_id: @user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
     if @user.update(user_params) 

      redirect_to profil_path
    else
      render :edit
    end
  end

end
