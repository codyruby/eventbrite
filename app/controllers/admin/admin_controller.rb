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
      
    end

    def edit 

    end

    def update
    end

    def destroy
    end

    private

    def check_if_admin
      unless current_user.admin == true
        flash[:error] = "Vous n'êtes pas le créateur de l'évènement => Impossilble de le modifier."
       redirect_to root_path
      end
    end

end 