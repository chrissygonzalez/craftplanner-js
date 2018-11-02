class ProjectsController < ApplicationController
   def new
       @project = Project.new(user_id: current_user.id)
   end
   
   def index
       @projects = User.find(current_user.id).projects
       @user = current_user
   end

    def create
        @project = Project.create(project_params)
        @project.start_date = DateTime.now
        @project.save
        # @message = @ride.take_ride
        # flash[:notice] = @message
        redirect_to user_projects_path(@project.user.id)
    end
    
    def update
        # binding.pry
        @project = Project.find(params[:id])
        @project.update(end_date: DateTime.now)
        redirect_to user_projects_path(@project.user.id)
    end
    
    def delete
        binding.pry
        # project.find()
    end
    
    private
    
    def project_params
        params.require(:project).permit(:user_id, :craft_id)
    end
end