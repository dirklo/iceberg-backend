require 'rails_helper'

RSpec.describe Users, type: :request do
  # initialize test data
  let!(:users) {create_list(:user,2)}
  let!(:user_id) {categories.first.id}

  # Test suite for GET /user
  describe "GET /users" do
    # make HTTP get request before each example
    before {get '/api/v1/users'}
    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to (eq 2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end