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
        #TODO: consolidate by material instead of duplicating
        user_material = UserMaterial.create(user_material_params)
        render json: {name: user_material.material.name, quantity: user_material.quantity}
    end
    
    def destroy
        @user_material = UserMaterial.find(params[:id])
        @user_material.delete
        redirect_to user_user_materials_path(current_user.id)
    end
    
    private
    
    def user_material_params
        params.require(:user_material).permit(:user_id, :material_id, :quantity,
        material_attributes: [:name])
    end
end