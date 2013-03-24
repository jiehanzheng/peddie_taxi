class Proposal < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user
  has_many :signups
end
