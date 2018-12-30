class WelcomeController < ApplicationController
    skip_before_action :require_signin
    
    def index
        session.clear
        @signed_out = !signed_in?
    end
end