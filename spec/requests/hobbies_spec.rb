require 'rails_helper'

RSpec.describe Hobby, type: :request do
  # initialize test data
  let!(:hobbies) { create_list(:hobby, 2) }
  let!(:hobby_id) { hobbies.first.id }
  
  #Test suite for GET /hobbies
  describe "GET /hobbies" do    
    #make HTTP GET request before each example
    before { get '/hobbies' }
    it 'returns hobbies' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  #Test suite for POST /hobbies
  describe "POST /hobbies" do 
    #valid payload
    let(:valid_hobby) {{
      name: Faker::String.random(length: 4)
    }}
    context 'when request is valid' do
      before { post '/hobbies', params: {hobby: valid_hobby} }
      it 'creates a new hobby' do
        expect(json["name"]).to eq(valid_hobby[:name])
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET /hobbies/:hobby_id' do
    before { get "/hobbies/#{hobby_id}"}
    context 'when request is valid' do
      it 'returns hobby' do
        expect(json["id"]).to eq(hobby_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'GET /hobbies/:hobby_id' do
    before { get "/hobbies/#{-1}"}
    context 'when request is invalid' do
      it 'returns failure message' do
        expect(json).to include("message" => "Hobby is not found")
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /hobbies/:hobby_id' do
    before { delete "/hobbies/#{hobby_id}"}
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
