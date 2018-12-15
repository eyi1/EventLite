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
        self.where("starts >= ?", Time.zone.today.beginning_of_day)
    end
 
    def self.old_events
         self.where("starts < ?", Time.zone.today.beginning_of_day)
    end

    def to_next_event
        event = Event.where("id > ?", id).first
        
        if event
            event
        else
            Event.first
        end
    end

    # def rsvp(event)
    #     binding.pry
    # end
end