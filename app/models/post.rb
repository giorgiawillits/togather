# app/models/user.rb

class Post < ActiveRecord::Base
    belongs_to :user
    has_and_belongs_to_many :groups
end
