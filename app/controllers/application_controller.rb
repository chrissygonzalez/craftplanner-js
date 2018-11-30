class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :require_signin
 
    private
 
    def require_signin
        unless signed_in?
            flash[:error] = "You must sign in to access this section"
            redirect_to signin_path # halts request cycle
        end
    end
end
