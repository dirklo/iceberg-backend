require 'rails_helper'

RSpec.describe "Foods", type: :request do
  # initialize test data
  let!(:foods) { create_list(:food, 5) }
  let!(:food_id) { foods.first.id }
  
  #Test suite for GET /foods
  describe "GET /foods" do    
    #make HTTP GET request before each example
    before { get '/foods' }
    it 'returns foods' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
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
end
