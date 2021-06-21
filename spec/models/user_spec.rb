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

  context 'Presence of' do
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
      it 'validates presence' do
        user = User.new
        user.email = ""
        user.validate
        expect(user.errors[:email]).to include("can't be blank")

        user.email = "test"
        user.validate
        expect(user.errors[:email]).to_not include("can't be blank")
      end
    end
  end
end
