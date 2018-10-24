class User < ActiveRecord::Base
    has_many :projects
    has_many :crafts, through: :projects
end