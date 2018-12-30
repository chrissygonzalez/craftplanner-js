class SessionsController < ApplicationController
  skip_before_action :require_signin, only: [:new, :create]
  
  def new
    @user = User.new
    @users = User.all
    @signed_out = !signed_in?
  end
  
  def create
    if params[:user_name]
      @user = User.find_by(name: params[:user_name])
      if @user && @user.authenticate(params[:password])
        signin(@user)
        redirect_to user_path(@user.id)
      else
        redirect_to new_user_path
      end
    elsif auth['uid']
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        u.password_digest = auth['credentials']['token']
      end
        signin(@user)
        redirect_to user_path(@user.id)
    end
  end
  
  def destroy
      session.delete :user_id if session[:user_id]
      redirect_to '/'
  end
  
  private
 
    def auth
        request.env['omniauth.auth']
    end
end