require 'rails_helper'

RSpec.describe Users, type: :request do
  # initialize test data
  let!(:users) { create_list(:user,2) }
  let!(:user_id) { users.first.id }

  # Test suite for GET /user
  describe "GET /users" do
    # make HTTP get request before each example
    before {get '/users'}
    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:user_id' do
    before { get "/users/#{user_id}"}
    context 'when request is valid' do
      it 'returns user' do
        expect(json["id"]).to eq(user_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'GET /users/:user_id' do
    before { get "/users/#{-1}"}
    context 'when request is invalid' do
      it 'returns failure message' do
        expect(json).to include("message" => "User is not found")
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
