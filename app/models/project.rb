class Project < ActiveRecord::Base
    belongs_to :craft
    belongs_to :user
    
end