class MaterialsController < ApplicationController
    def index
        @materials = Material.alphabetize
    end
    
    def new
        @material = Material.new
    end
    
    def create
        # binding.pry
        @material = Material.find_by name: params[:material][:name] ||= nil
        if @material.nil?
            @material = Material.create(material_params)
            if !@material.valid?
                render :new
            else
                redirect_to materials_path
            end
        else
            redirect_to materials_path
        end
    end
    
    private
    
    def material_params
        params.require(:material).permit(:name)
    end
end