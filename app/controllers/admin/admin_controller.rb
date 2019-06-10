class Admin::AdminController < ApplicationController
  before_action :check_if_admin

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create 
      @user = User.new(user_params)
 
      if @user.save
        redirect_to admin_root
      else
        render 'new'
      end
      
    end

    def edit 
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
 
      if @user.update(user_params)
        redirect_to admin_root
      else
        render 'edit'
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    
      redirect_to admin_path
    end

    private

    def check_if_admin
      unless current_user.admin == true
        flash[:error] = "Vous n'êtes pas le créateur de l'évènement => Impossilble de le modifier."
       redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :description)
    end

end 