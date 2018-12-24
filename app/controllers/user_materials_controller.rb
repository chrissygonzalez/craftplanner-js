class UserMaterialsController < ApplicationController
    def index
        @user = current_user
        @user_materials = User.find(@user.id).user_materials ||= nil
    end
    
    def new
        @user_material = UserMaterial.new
        @user_material.material = Material.new
    end
    
    def create
        # binding.pry
        @user_material = UserMaterial.create(user_material_params)
        
        if @user_material.valid?
            redirect_to user_user_materials_path
        else
            render :new
        end
    end
    
    private
    
    def user_material_params
        params.require(:user_material).permit(:user_id,
        material_attributes: [:name])
    end
end