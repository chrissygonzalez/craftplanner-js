class Project < ActiveRecord::Base
    belongs_to :craft
    belongs_to :user
    
    def done?
        end_date
    end
end