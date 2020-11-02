require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }

  describe "GET /items" do
    it "works! (now write some real specs)" do
      get item_path(item.id)
      expect(response).to have_http_status(200)
    end
  end
end
