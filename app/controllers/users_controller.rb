class UsersController < ApplicationController
   skip_before_action :require_signin, only: [:new, :create]
    
   def new
       @signed_out = !signed_in?
       @user = User.new
   end
   
   def create
        @user = User.create(user_params)
        if @user.valid?
            signin(@user)
            redirect_to user_path(@user.id)
        else
            # binding.pry
            @signed_out = !signed_in?
            render :new
        end
   end
   
   def show
       @user = User.find(params[:id])
       @projects = Project.all
   end
   
   
   private
   
   def user_params
       params.require(:user).permit(:name, :password, :password_confirmation)
   end
end