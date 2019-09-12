class CraftsController < ApplicationController
    def index
        if params[:method]
            @crafts = Craft.filter(params[:method])
        elsif params[:material_id]
            @material = Material.find(params[:material_id])
            @crafts = Craft.has_material(@material.name)
        else
            @crafts = Craft.all
            respond_to do |format|
                format.html { render :index }
                format.json { render json: @crafts, status: 200 }
              end
        end
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
    
    private
    
    def craft_params
        params.require(:craft).permit(:title, :description, :method, :source, :id, 
        craft_materials_attributes: [:quantity, :material_id,
        material_attributes: [:name]
        ])
    end
end