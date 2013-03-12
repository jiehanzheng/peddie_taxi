class AccommodationChange < ActiveRecord::Base
  attr_accessible :field, :new_value, :old_value, :user_id
end
