class User < ApplicationRecord
    has_many :created_events, class_name: 'Event'
    has_many :attended_events, through: :invitations
    has_many :invitations, foreign_key: :atendee_id
end
