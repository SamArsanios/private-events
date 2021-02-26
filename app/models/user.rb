class User < ApplicationRecord
  has_many :invitations, foreign_key: :atendee_id
  has_many :attended_events, through: :invitations
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
end
