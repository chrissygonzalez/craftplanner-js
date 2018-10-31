class CraftsController < ApplicationController
    def index
        @crafts = Craft.all
    end
    
    def new
        @craft = Craft.new
    end
    
    def create
        # binding.pry
        @craft = Craft.create(craft_params)
        redirect_to craft_path(@craft.id)
    end
    
    def show
        @project = Project.new
        @user = current_user
        @craft = Craft.find(params[:id])
    end
    
    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            category = Category.find_or_create_by(category_attribute)
            self.categories << category
        end
    end
    
    private
    
    def craft_params
        params.require(:craft).permit(:title, :description, :method, :source, material_ids:[], materials_attributes: [:name])
    end
end