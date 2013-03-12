class Venue < ActiveRecord::Base
  has_many :requests

  attr_accessible :description, :latitude, :longitude, :name, :street, :city

  composed_of :address, :mapping => [%w(address address), %w(city city)]

  validates :name, :street, :city, :presence => true
  validates :latitude, :numericality => { :greater_than_or_equal_to => -180,
                                          :less_than_or_equal_to => 180 }
  validates :longitude, :numericality => { :greater_than_or_equal_to => -180,
                                           :less_than_or_equal_to => 180 }
end
