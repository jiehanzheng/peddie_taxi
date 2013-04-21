class Accommodation < ActiveRecord::Base
  belongs_to :proposal
  has_many :signups
  belongs_to :user
end
