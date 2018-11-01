class Project < ActiveRecord::Base
    belongs_to :craft
    belongs_to :user
    
    def end_project
        binding.pry
    end
end