class ProjectsController < ApplicationController
   def new
       @project = Project.new
   end

    def create
        @project = Project.create(project_params)
        # @message = @ride.take_ride
        # flash[:notice] = @message
        redirect_to user_path(@project.user.id)
    end
    
    private
    
    def project_params
        params.require(:project).permit(:user_id, :craft_id)
    end
end