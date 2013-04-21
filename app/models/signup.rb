class Signup < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal
  belongs_to :accommodation
end
