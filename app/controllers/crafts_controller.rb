class CraftsController < ApplicationController
    def index
        @crafts = Craft.all
    end
    
    def new
        @craft = Craft.new
        @craft.craft_materials.build
        @craft.craft_materials.each do |craft_material|
            craft_material.build_material
        end
    end
    
    def create
        @craft = Craft.create(craft_params)
        if @craft.valid?
            redirect_to craft_path(@craft.id)
        else
            @craft.craft_materials.clear
            @craft.craft_materials.build
            @craft.craft_materials.each do |craft_material|
                craft_material.build_material
            end
            render :new
        end
    end
    
    def show
        @project = Project.new(user_id: current_user.id)
        @user = current_user
        @craft = Craft.find(params[:id])
    end
    
    def destroy
        @craft = Craft.find(params[:id])
        @craft.delete
        redirect_to crafts_path
    end
    
    def craft_materials_attributes=(craft_materials_attributes)
        binding.pry
    end
    
    def materials_attributes=(materials_attributes)
        binding.pry
    end
    
    private
    
    def craft_params
        params.require(:craft).permit(:title, :description, :method, :source, :id, 
        craft_materials_attributes: [:quantity, :material_id,
        material_attributes: [:name]
        ])
    end
end