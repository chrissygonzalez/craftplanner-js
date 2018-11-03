class Project < ActiveRecord::Base
    belongs_to :craft
    belongs_to :user
    scope :completed, -> { where(end_date: true) }
    
    def done?
        end_date
    end
end