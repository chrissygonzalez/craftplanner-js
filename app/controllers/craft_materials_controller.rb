class CraftMaterialsController < ApplicationController
    def new
        @craft = Craft.find(params[:craft_id])
        @craft_material = CraftMaterial.new
        @craft_material.build_material
    end
    
    def create
        @craft_material = CraftMaterial.create(craft_material_params)
        if @craft_material.valid?
            redirect_to craft_path(@craft_material.craft.id)
        else
            # binding.pry
            @craft = Craft.find(params[:craft_id])
            # @craft_material = CraftMaterial.new
            @craft_material.build_material
            render :new
        end
    end
    
    private
    
    def craft_material_params
        params.require(:craft_material).permit(:material_id, :craft_id, :quantity, 
        material_attributes: [:name])
    end
end