class CraftsController < ApplicationController
    def index
        # binding.pry can use the keyword like, and add avariable to the query. 
        # add a nested new route where the number matters, something changes if number changes. can add material to existing craft.
        # nested show. usermaterial show needs to use the user_id
        if params[:method]
            @crafts = Craft.filter(params[:method])
        else
            @crafts = Craft.all
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