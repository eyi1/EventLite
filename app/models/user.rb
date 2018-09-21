class User < ApplicationRecord
    has_many :attendances
    has_many :events, :through => :attendances

    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }
    has_secure_password

    def member_since
    end
end
 