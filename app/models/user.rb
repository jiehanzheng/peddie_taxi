class User < ActiveRecord::Base

  has_many :signups
  has_many :venues
  has_many :proposals
  

  class NonePeddieLoginError < RuntimeError; end


  def self.from_omniauth(auth)
    user = where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    
    begin
      user = update_from_omniauth(auth, user)
      user.save!
    rescue
      raise "Failure updating your record in users table."
    end

    user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]

      user = update_from_omniauth(auth, user)
    end
  end


  private

  def self.update_from_omniauth(auth, user)
    if 'peddie' == auth["provider"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.full_name = auth["info"]["full_name"]

      unless auth["info"]["email"] =~ /^(?:[a-z\-]+)(?:-(\d{2}))?@peddie\.org$/
        raise NonePeddieLoginError
      end

      user.email = auth["info"]["email"]

      if $1.blank?
        user.school_role = 'faculty'
      else
        user.school_role = 'student'
        user.graduation_year = $1
      end
    elsif 'identity' == auth["provider"]
      user.site_role = 'admin'
    end

    user.site_role ||= 'user'

    user
  end
end
