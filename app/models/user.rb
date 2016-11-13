# app/models/user.rb

class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
    message: ": an email is incorrectly formatted" }
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  has_and_belongs_to_many :networks
  has_one :network
  
  
  has_and_belongs_to_many :groups
  has_many :events
  has_many :posts
  has_many :shared_events, :class_name => "Event", :foreign_key => 'event_id', :through => :groups

  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  def first_name_initial
    self.first_name.capitalize + " " + self.last_name.capitalize[0] + "."
  end
  
  def upcoming_events
    next_week = self.shared_events.where("start_time >= :today AND start_time <= :end_of_week", 
                                          {today: Time.now, end_of_week: 7.days.from_now})
    events = {}
    next_week.each do |event|
      start_hour = event.start_time.hour
      day = event.start_time.wday
      if events.include? start_hour
        if events[start_hour].include? day
          events[start_hour][day] << event
        else
          events[start_hour] = [event]
        end
      else
        events[start_hour] = {day => [event]}
      end
    end
    
  end
  
end
