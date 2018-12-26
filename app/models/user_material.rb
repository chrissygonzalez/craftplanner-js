class UserMaterial < ActiveRecord::Base
    belongs_to :user
    belongs_to :material
    accepts_nested_attributes_for  :material, :reject_if => :all_blank
    validates_presence_of :material
    validates_presence_of :quantity
end