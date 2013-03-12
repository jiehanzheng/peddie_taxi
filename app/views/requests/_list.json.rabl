collection @requests

attributes :id, :stay_duration, :earliest_departure_time, :latest_departure_time,
           :note

child :venue do
  attributes :name, :street, :city, :latitude, :longitude
end

node(:earliest_departure_time) { |request| request.earliest_departure_time.to_i }
node(:latest_departure_time) { |request| request.latest_departure_time.to_i }

node :departure_time_slots do |request|
  all_slots = Array.new
  request.departure_time_slots.each do |time_slot|
    all_slots << { :start => time_slot[:start].to_i, :end => time_slot[:end].to_i }
  end
  all_slots
end