# app/models/user.rb

class Event < ActiveRecord::Base
    belongs_to :user
    belongs_to :group
end
