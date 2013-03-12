class Address
  attr_reader :street, :city
  
  def initialize(street, city)
    @street, @city = street, city
  end

  def ==(other_address)
    city == other_address.city && street == other_address.street
  end
end