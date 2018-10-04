class Event < ApplicationRecord
    # extend TimeSplitter::Accessors
    # split_accessor :starts

    has_many :attendances
    has_many :users, :through => :attendances

    validates :title, presence: true
    validates :location, presence: true
    validates :starts, presence: true
    validates :ends, presence: true
    validates :description, presence: true

    def self.from_today
        self.where("starts >=?", Time.zone.today.beginning_of_day)
    end
 
    def self.old_events
         self.where("ends <?", Time.zone.today.beginning_of_day)
    end
end