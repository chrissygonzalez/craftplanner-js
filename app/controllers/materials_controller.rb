class MaterialsController < ApplicationController
    def index
        @materials = Material.all
    end
    
    def new
        @material = Material.new
    end
end