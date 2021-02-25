class Event < ApplicationRecord
    has_many :invitations, foreign_key: :attended_event_id
    has_many :atendees, through: :invitations, class_name: "User"
    belongs_to :creator ,foreign_key: 'creator_id' ,class_name: "User" 
end
