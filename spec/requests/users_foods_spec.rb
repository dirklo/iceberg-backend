require 'rails_helper'

RSpec.describe "UsersFood", type: :request do
  describe "GET /usersfoods" do
    #initialize test data
    let!(:user) { create(:user) }
    #Test suite for GET /usersfoods
    describe "GET /usersfood" do
      #make HTTP GET request before each example
      before { get "/users/#{user.id}/usersfood" } 
      it 'returns usersfood' do
        expect(json).not_to be_empty
        expect(json.size).to eq(2)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  #Test suite for POST /usersfood
  describe "POST /usersfood" do
    let!(:foods) { [{name: Faker::Food.dish}, {name: Faker::Food.dish}] }
    let!(:food) { foods.first}
    let!(:user) { create(:user) }
    context 'when request is valid' do
      before { post "/users/#{user.id}/usersfood", params: {foods:foods} }      
      it 'adds additional foods to user' do
        expect(added(food[:name])).to eq(true)
      end      
      it 'creates foods not save in the database' do
        expect(created(food[:name])).to eq(true)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when request is invalid' do
      before { post "/users/#{user.id}/usersfood", params: {foods: {}}}
      it 'returns failure message' do
        expect(json).to include("message" => "No food was added")
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
