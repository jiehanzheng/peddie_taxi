class Request < ActiveRecord::Base
  belongs_to :venue

  attr_accessible :departure_time_slots, :note, :stay_duration, :venue_id
  
  serialize :departure_time_slots

  validates :venue_id, :presence => true
  validates :stay_duration, :numericality => { :greater_than_or_equal_to => 0.5,
                                              :less_than_or_equal_to => 12 }
  validate :departure_time_slots, :depature_time_slots_must_be_present,
                                  :departure_times_must_be_in_the_future,
                                  :departure_time_slot_end_times_must_be_later_than_start_times,
                                  :departure_time_slots_must_not_overlap

  before_save :update_earliest_and_latest_departure_times

  include AASM
  aasm :column => 'resolution' do
    state :waiting, :initial => true
    state :accommodated
    state :canceled

    event :accommodate do
      transitions :from => :waiting, :to => :accommodated
    end

    event :stop_waiting do
      transitions :from => :waiting, :to => :canceled
    end

    event :give_up_accommodation do
      transitions :from => :accommodated, :to => :canceled
    end

    event :choose_another_accommodation do
      transitions :from => :accommodated, :to => :waiting
    end
  end


  def self.future_waiting
    where(:resolution => 'waiting')
      .where("latest_departure_time > ?", Time.zone.now)
  end


  private

  # FIXME: actual validation is missing

  def depature_time_slots_must_be_present
    if departure_time_slots.blank?
      errors.add(:departure_time_slots, "must be provided")
    end
  end

  def departure_times_must_be_in_the_future
    if not departure_time_slots.blank?
      if not departure_time_slots.first[:start].future?
        errors.add(:departure_time_slots, "must be in the future")
      end
    end
  end

  def departure_time_slot_end_times_must_be_later_than_start_times
    if not departure_time_slots.blank?
      departure_time_slots.each do |time_slot|
        if not time_slot[:start] < time_slot[:end]
          errors.add(:departure_time_slots, "must have a start time before end time")
        end
      end
    end
  end

  def departure_time_slots_must_not_overlap
    if not departure_time_slots.blank?
      #
      # slot_id_with_first_removed is the index in the new sliced array, not the
      # original array!  Therefore,
      #
      # +----------------------------+
      # | Real | 0 | 1 | 2 | 3 | ... |
      # +----------------------------+
      # | New  | - | 0 | 1 | 2 | ... |
      # +----------------------------+
      #
      departure_time_slots[1..-1].each_with_index do |time_slot, slot_id_with_first_removed|
        if not time_slot[:start] >= departure_time_slots[slot_id_with_first_removed-1+1][:end]
          errors.add(:departure_time_slots, "must not overlap")
        end
      end
    end
  end

  def update_earliest_and_latest_departure_times
    # assume that the dates and departure times are sorted, our job is simply to
    # grab the first element in the array, assign earliest to its starting time,
    # grab the last, and assign latest to its ending time.

    self.earliest_departure_time = departure_time_slots.first[:start]
    self.latest_departure_time   = departure_time_slots.last[:end]
  end

end
