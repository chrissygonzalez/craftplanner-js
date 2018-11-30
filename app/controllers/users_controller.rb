class UsersController < ApplicationController
   skip_before_action :require_signin, only: [:new, :create]
    
   def new
       @user = User.new
   end
   
   def create
        @user = User.create(user_params)
         signin(@user)
        # binding.pry
        redirect_to user_path(@user.id)
   end
   
   def show
       @user = User.find(params[:id])
       @projects = Project.all
   end
   
   
   private
   
   def user_params
       params.require(:user).permit(:name, :password)
   end
end