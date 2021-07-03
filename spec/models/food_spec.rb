require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'ActiveRecord associations' do
    it { should have_many(:users_foods)}
  end  

  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name).ignoring_case_sensitivity}
  end
end