class User < ApplicationRecord
    has_many :attendances
    has_many :events, :through => :attendances
    #accepts_nested_attributes_for :events

    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }
    has_secure_password

    def member_since
        self.created_at.strftime("%B %Y")
    end

     def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash[:info][:email]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end 

    # def self.from_today
    #    self.where(:event)
    #    self.where("created_at >=?", Time.zone.today.beginning_of_day)
    # end

    # def self.old_events
    #     self.where("created_at <?", Time.zone.today.beginning_of_day)
    # end
end