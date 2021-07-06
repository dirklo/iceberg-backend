require 'rails_helper'

RSpec.describe "UsersHobby", type: :request do
  describe "GET /usershobby" do
    #initialize test data
    let!(:user) { create(:user) }
    #Test suite for GET /usershobbys
    describe "GET /usershobby" do
      #make HTTP GET request before each example
      before { get "/users/#{user.id}/usershobby" } 
      it 'returns usershobby' do
        expect(json).not_to be_empty
        expect(json.size).to eq(2)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  #Test suite for POST /usershobby
  describe "POST /usershobby" do
    let!(:hobbys) { [{name: Faker::String.random(length: 4)}, {name: Faker::String.random(length: 4)}] }
    let!(:hobby) { hobbys.first}
    let!(:user) { create(:user) }
    context 'when request is valid' do
      before { post "/users/#{user.id}/usershobby", params: {hobbies:hobbys} }      
      it 'adds additional hobbys to user' do
        expect(added(hobby[:name])).to eq(true)
      end      
      it 'creates hobbys not save in the database' do
        expect(created(hobby[:name])).to eq(true)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when request is invalid' do
      before { post "/users/#{user.id}/usershobby", params: {hobbys: {}}}
      it 'returns failure message' do
        expect(json).to include("message" => "No hobby was added")
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end 

  #test suite for DELETE /usershobby
  describe 'DELETE /usershobby' do
    let!(:hobby) { create(:hobby) }
    let!(:user) { create(:user) }
    context 'when delete is successful' do
      before { user.hobbies << hobby }
      before { delete "/users/#{user.id}/usershobby/#{hobby.id}"}
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
    context 'when delete is unsuccessful' do
      before { delete "/users/#{user.id}/usershobby/#{-1}"}
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
    
  end

end

 
