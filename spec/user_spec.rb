require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe 'User', type: :model do
  it 'is valid with a username' do
    user = User.create(name: 'Rose')
    expect(user).to be_valid
  end
  it 'is not valid without a username' do
    user = User.create(name: '')
    expect(user).not_to be_valid
  end
  it 'is not valid when the user already exists' do
    user = User.create(name: 'Rose')
    expect(user).not_to be_valid
  end

  describe 'associations' do
    it 'can have many created events' do
      user = User.reflect_on_association(:created_events)
      expect(user.macro).to eql(:has_many)
    end
    it 'can have many attended events' do
      user = User.reflect_on_association(:attended_events)
      expect(user.macro).to eql(:has_many)
    end
  end
end

RSpec.feature 'Users' do
  before(:each) do
    @user = User.create(name: '1')
  end

  before(:each) do
    @event = @user.created_events.build(event_name: 'birthday', event_description: 'party', location:'mombasa', event_date:'2020-01-10')
    @event.save
  end

  scenario 'when a user clicks the Signin button' do
    visit root_path
    click_on 'Sign in'
    expect(page).to have_content 'Sign In'
  end

  scenario 'when a user logs in' do
    visit '/users/sign_in'
    fill_in 'name', with: '1'
    click_on 'Submit'
    expect(page).to have_content 'Logged in as:'
    expect(page).to have_content '1'
    expect(current_path).to eql('/users/1')
  end

  scenario 'when a user logs out' do
    visit '/users/sign_in'
    fill_in 'name', with: '1'
    click_on 'Submit'
    click_on 'Log out'
    expect(page).not_to have_content 'Logged in as:'
    expect(page).to have_content 'Sign in'
  end

  scenario 'when a user signs up' do
    visit '/users/new'
    fill_in 'user_name', with: 'new_user'
    click_on 'Submit'
    expect(page).to have_content 'Logged in as:'
    expect(page).to have_content 'new_user'
  end

  scenario 'when a user logs in and navigates to the main page' do
    visit 'users/sign_in'
    fill_in 'name', with: 1
    click_on 'Submit'
    click_on 'Events'
    expect(page).to have_content 'Logged in as:'
    expect(page).to have_content '1'
    expect(current_path).to eql(root_path)
  end
end