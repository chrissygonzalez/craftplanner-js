class Project < ActiveRecord::Base
    belongs_to :craft
    belongs_to :user
    
    def start_project(project)
        # project.start_date = DateTime.now
    end
    
    def end_project(project)
        binding.pry
    end
end