class ProjectsController < ApplicationController
   def new
       @project = Project.new(user_id: current_user.id)
   end
   
   def index
        # binding.pry
       @projects = User.find(current_user.id).projects ||= nil
       @user = current_user
   end

    def create
        @project = Project.create(project_params)
        @project.start_date = DateTime.now
        @project.save
        redirect_to user_path(@project.user.id)
    end
    
    def update
        # binding.pry
        @project = Project.find(params[:project][:id])
        @project.update(end_date: DateTime.now)
        redirect_to user_path(@project.user.id)
    end
    
    def destroy
        # binding.pry
        @project = Project.find(params[:project][:id])
        @project.delete
        redirect_to user_path(@project.user.id)
    end
    
    private
    
    def project_params
        params.require(:project).permit(:user_id, :craft_id)
    end
end