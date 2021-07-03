require 'rails_helper'

RSpec.describe "Foods", type: :request do
  # initialize test data
  let!(:foods) { create_list(:food, 2) }
  let!(:food_id) { foods.first.id }
  
  #Test suite for GET /foods
  describe "GET /foods" do    
    #make HTTP GET request before each example
    before { get '/foods' }
    it 'returns foods' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  #Test suite for POST /foods
  describe "POST /foods" do 
    #valid payload
    let(:valid_food) {{
      name: Faker::Food.dish
    }}
    context 'when request is valid' do
      before { post '/foods', params: {food: valid_food} }
      it 'creates a new food' do
        expect(json["name"]).to eq(valid_food[:name])
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET /foods/:food_id' do
    before { get "/foods/#{food_id}"}
    context 'when request is valid' do
      it 'returns food' do
        expect(json["id"]).to eq(food_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'GET /foods/:food_id' do
    before { get "/foods/#{-1}"}
    context 'when request is invalid' do
      it 'returns failure message' do
        expect(json).to include("message" => "Food is not found")
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /foods/:food_id' do
    before { delete "/foods/#{food_id}"}
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
