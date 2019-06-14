class UsersController < ApplicationController
  before_action :user_id , only: [:edit, :update]
    def new
      @users = User.new
    end
    def create
      @users = User.new(name:params[:name], email:params[:email],password:params[:password] )
      #@users = User.new(user_params)
      if @users.save
        redirect_to new_user_path
      else
        render :new
      end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
     if @users.update(user_params)

       redirect_to @users
     else
       render :new
     end

    end
    def show
        @user = User.find(params[:id])
    end
    private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def user_id
      @users = User.find(params[:id])
    end

end
