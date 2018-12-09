class Event < ApplicationRecord
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
         self.where("starts <?", Time.zone.today.beginning_of_day)
    end

    def rsvp(event)
        binding.pry
    end

    # def start_date
    #     self.starts = DateTime.strftime "%m/%d/%Y %H:%M"
    # end
    
    #   def check_in_date_string=(date_string)
    #     binding.pry
    #     self.starts = Date.strptime(date_string, '%m/%d/%Y')
    #   end
    #   def check_in_date_string
    #     starts.strftime('%m/%d/%Y')
    #   end
    
    # def end_date_time
    #     ends = Time.new 
    #     ends.strftime("%m/%d/%Y") 
        
    # end
end
