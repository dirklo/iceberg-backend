require 'rails_helper'

RSpec.describe Hobby, type: :model do
  context 'ActiveRecord associations' do
    it { should have_many(:users_hobbies)}
  end  

  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name).ignoring_case_sensitivity}
  end
end