class Event < ApplicationRecord
    belongs_to :location
    belongs_to :host, class_name: "User"
end
