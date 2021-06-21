require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveRecord associations' do
    it 'belongs to team' do
      expect(User.reflect_on_association(:team).macro).to be (:belongs_to)
    end

    it 'has many foods' do
      expect(User.reflect_on_association(:foods).macro).to be (:has_many)
    end

    it 'has many hobbies' do
      expect(User.reflect_on_association(:hobbies).macro).to be (:has_many)
    end
  end  

  describe 'first name' do
    it 'validates presence' do
      user = User.new
      user.first_name = ""
      user.validate
      expect(user.errors[:first_name]).to include("can't be blank")

      user.first_name = "test"
      user.validate
      expect(user.errors[:first_name]).to_not include("can't be blank")
    end
  end

  describe 'last name' do
    it 'validates presence' do
      user = User.new
      user.last_name = ""
      user.validate
      expect(user.errors[:last_name]).to include("can't be blank")

      user.last_name = "test"
      user.validate
      expect(user.errors[:last_name]).to_not include("can't be blank")
    end
  end

  describe 'username' do
    it 'validates presence' do
      user = User.new
      user.username = ""
      user.validate
      expect(user.errors[:username]).to include("can't be blank")

      user.username = "test"
      user.validate
      expect(user.errors[:username]).to_not include("can't be blank")
    end
  end

  describe 'email' do
    it { should validate_presence_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
  end
end
