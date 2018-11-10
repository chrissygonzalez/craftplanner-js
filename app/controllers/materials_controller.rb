class MaterialsController < ApplicationController
    def index
        @materials = Material.all
    end
    
    def new
        @material = Material.new
    end
    
    def create
        @material = Material.create(material_params)
        if !@material.valid?
            @message = @material.errors[:name]
            flash[:notice] = @message
            render :new
        else
            redirect_to materials_path
        end
    end
    
    private
    
    def material_params
        params.require(:material).permit(:name)
    end
end