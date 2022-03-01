class Event < ApplicationRecord
    belongs_to :location
    belongs_to :host, class_name: "User"
    has_many :events_guests, foreign_key: :attended_event_id
    has_many :guests, through: :events_guests
end
