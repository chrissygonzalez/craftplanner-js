class CraftsController < ApplicationController
    def index
        @crafts = Craft.all
    end
    
    def new
        @craft = Craft.new
        # binding.pry
        @craft.craft_materials.build
        @craft.craft_materials.build
        #has_many forms
    end
    
    def create
        @craft = Craft.create(craft_params)
        if @craft.valid?
            redirect_to craft_path(@craft.id)
        else
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
    
    # def categories_attributes=(category_attributes)
    #     category_attributes.values.each do |category_attribute|
    #         category = Category.find_or_create_by(category_attribute)
    #         self.categories << category
    #     end
    # end
    
    def materials_attributes=(materials_attributes)
    end
    
    def craft_materials_attributes=(craft_materials_attributes)
    end
    
    private
    
    def craft_params
        params.require(:craft).permit(:title, :description, :method, :source, :id, 
        # :material_ids, 
        craft_materials_attributes: [:quantity, :material_id])
    end
end