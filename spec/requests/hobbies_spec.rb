require 'rails_helper'

RSpec.describe "Hobbies", type: :request do
  describe "GET /hobbies" do
    it "works! (now write some real specs)" do
      get hobbies_index_path
      expect(response).to have_http_status(200)
    end
  end
end
