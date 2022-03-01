class User < ApplicationRecord
    has_many :hosted_events, foreign_key: :host_id, class_name: "Event"
    has_many :events_guests, foreign_key: :guest_id
    has_many :attended_events, through: :events_guests

    has_secure_password


    def name
        "#{self.first_name} #{self.last_name}"
    end
end
