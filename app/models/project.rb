class Project < ActiveRecord::Base
    belongs_to :craft
    belongs_to :user
    scope :complete, -> { where.not(end_date: nil) }
    scope :incomplete, -> { where end_date: nil }
    
    def done?
        end_date
    end
end