class Accommodation < ActiveRecord::Base
  attr_accessible :capacity, :departure_time, :user_id
end
