class MaterialsController < ApplicationController
    def index
        @materials = Material.all
    end
    
    def new
        @material = Material.new
    end
    
    def create
        @material = Material.create(material_params)
        redirect_to materials_path
    end
    
    private
    
    def material_params
        params.require(:material).permit(:name)
    end
end