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

  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}

    it {should validate_presence_of(:first_name) }

    it {should validate_presence_of(:last_name) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
