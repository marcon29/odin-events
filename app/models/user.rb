class User < ApplicationRecord
    has_many :hosted_events, foreign_key: :host_id, class_name: "Event"

    # has_secure_password


    def name
        "#{self.first_name} #{self.last_name}"
    end
end
