class Venue < ActiveRecord::Base
  has_many :proposals
  belongs_to :user


  def already_proposed_this_weekend?
    # TODO
  end
  
end
