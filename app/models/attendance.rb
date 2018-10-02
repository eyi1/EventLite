class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event

    validates :user_id, uniqueness: { scope: :event_id }
    validates :event_id, uniqueness: { scope: :user_id }
end
