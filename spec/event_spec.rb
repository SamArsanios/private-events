require 'rails_helper'

RSpec.describe 'Event', type: :model do
  it 'should be valid when every element is present' do
    user = User.create(name: 'Rose')
    event = Event.create(event_name: 'birthday', event_description: 'party', location: 'mombasa',
                         event_date: Date.today.to_s, creator_id: user.id)
    expect(event).to be_valid
  end

  it 'should not be valid when one of the elements is not present' do
    user = User.create(name: 'Rose')
    event = Event.create(event_name: '', event_description: 'party', location: 'mombasa',
                         event_date: Date.today.to_s, creator_id: user.id)
    expect(event).not_to be_valid
  end

  it 'should not be valid when the creator id is not present' do
    # user = User.create(name: 'Rose')
    event = Event.create(event_name: '', event_description: 'party', location: 'mombasa',
                         event_date: Date.today.to_s, creator_id: '')
    expect(event).not_to be_valid
  end

  describe 'associations' do
    it 'can have many attendees' do
      event = Event.reflect_on_association(:atendees)
      expect(event.macro).to eql(:has_many)
    end
    it 'belongs to one creator' do
      event = Event.reflect_on_association(:creator)
      expect(event.macro).to eql(:belongs_to)
    end
  end
end
