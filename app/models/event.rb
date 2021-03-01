class Event < ApplicationRecord
  has_many :invitations, foreign_key: :attended_event_id
  has_many :atendees, through: :invitations
  belongs_to :creator, class_name: 'User'

  scope :past, ->(date = Date.today.to_s) { where('event_date < ?', date) }
  scope :upcoming, ->(date = Date.today.to_s) { where('event_date >= ?', date) }

  validates :event_name, presence: true
  validates :event_description, presence: true
  validates :location, presence: true
  validates :event_date, presence: true
end
