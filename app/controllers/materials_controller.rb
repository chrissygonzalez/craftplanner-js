class MaterialsController < ApplicationController
    def index
        @materials = Material.alphabetize
        respond_to do |format|
            format.html { render :index }
            format.json { render json: @materials, status: 200 }
        end
    end
    
    def new
        @material = Material.new
    end
    
    def create
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

    def show
        @material = Material.find(params[:id])
        render json: @material, include: ['crafts'], status: 200
    end
    
    private
    
    def material_params
        params.require(:material).permit(:name)
    end
end