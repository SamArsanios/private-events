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