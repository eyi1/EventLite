class User < ApplicationRecord
    has_many :attendances
    has_many :events, :through => :attendances
    has_many :comments

    validates :name, presence: true
    #validates :email, uniqueness: true
    #validates :password, length: { in: 6..100 }

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { in: 6..100 }

    has_secure_password

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash[:info][:email], :name =>auth_hash[:info][:name]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
    
    def member_since
        self.created_at.strftime("%B %Y")
    end
end