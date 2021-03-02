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

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Events' do
  before(:each) do
    @user = User.create(name: 'user1')
  end

  before(:each) do
    @event = @user.created_events.build(event_name: 'birthday', event_description: 'party', location: 'mombasa',
                                        event_date: '2020-01-10')
    @event.save
  end

  scenario 'when a user creates an event' do
    visit '/users/sign_in'
    fill_in 'name', with: 'user1'
    click_on 'Submit'
    click_on 'Create event'
    fill_in 'event_event_name', with: 'new_event'
    fill_in 'event_event_date', with: '2021-5-12'
    fill_in 'event_event_description', with: 'description'
    fill_in 'event_location', with: 'location'
    click_on 'Submit'
    expect(page).to have_content 'new_event'
  end

  scenario 'when a user creates an event and leaves one field blank' do
    visit '/users/sign_in'
    fill_in 'name', with: 'user1'
    click_on 'Submit'
    click_on 'Create event'
    fill_in 'event_event_name', with: 'new_event'
    fill_in 'event_event_date', with: '2021-5-12'
    fill_in 'event_event_description', with: nil
    fill_in 'event_location', with: 'location'
    click_on 'Submit'
    expect(page).to have_content 'description can\'t be blank'
  end

  scenario 'when a user clicks on a event' do
    visit root_path
    click_on 'birthday'
    expect(current_path).to eql('/events/1')
  end

  scenario 'when a signed in user attends an  event' do
    visit 'users/sign_in'
    fill_in 'name', with: 'user1'
    click_on 'Submit'
    click_on 'Events'
    click_on 'birthday'
    click_on 'Attend this event'
    expect(@event.atendees.exists?(1)).to eql(true)
  end

  scenario 'when a signed in user visits an event but does not attend' do
    visit 'users/sign_in'
    fill_in 'name', with: 'user1'
    click_on 'Submit'
    click_on 'Events'
    click_on 'birthday'
    expect(@event.atendees.exists?(1)).to eql(false)
  end
end

# rubocop:enable Metrics/BlockLength
