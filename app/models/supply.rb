class Supply < ActiveRecord::Base
    belongs_to :craft
    belongs_to :material
end