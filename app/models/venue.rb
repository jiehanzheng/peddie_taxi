class Venue < ActiveRecord::Base
  has_many :proposals
  belongs_to :user
end
