class UserMaterialsController < ApplicationController
    def index
        @user = current_user
        @user_materials = User.find(@user.id).user_materials ||= nil
    end
end