# app/models/user.rb

class Network < ActiveRecord::Base
    has_and_belongs_to_many :users
    belongs_to :user


end
