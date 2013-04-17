class Proposal < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user
  has_many :signups
  has_many :accommodations


  def self.this_week_year
    DateTime.now.strftime("%Y").to_i
  end

  def self.this_week_number
    DateTime.now.strftime("%V").to_i
  end

  def self.next_week_year
    1.week.from_now.strftime("%Y").to_i
  end

  def self.next_week_number
    1.week.from_now.strftime("%V").to_i
  end

  def self.this_week
    where("year = ?", self.this_week_year).where("week = ?", self.this_week_number)
  end

  def self.next_week
    where("year = ?", self.next_week_year).where("week = ?", self.next_week_number)
  end


  def relative_week
    case 
    when year == self.class.this_week_year && week == self.class.this_week_number
      return :this_week
    when year == self.class.next_week_year && week == self.class.next_week_number
      return :next_week
    else
      :some_other_week
    end
  end


  def relative_week=(this_week_or_next_week)
    if this_week_or_next_week == "next_week"
      self.year = self.class.next_week_year
      self.week = self.class.next_week_number
    else
      self.year = self.class.this_week_year
      self.week = self.class.this_week_number
    end
  end

end
