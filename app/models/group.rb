# app/models/user.rb

class Group < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :posts
    has_many :shared_events
end
