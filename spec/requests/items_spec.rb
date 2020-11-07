require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }

  describe "GET /items" do
    it "記事の詳細を表示できる" do
      get item_path(item.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /items" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '記事が保存される' do
        item_params = attributes_for(:item)
        post items_path({item: item_params})
        expect(response).to have_http_status(302)
        expect(Item.last.content).to eq(item_params[:content])
        #item.rbに定義されているvalidationがあると保存されない
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        item_params = attributes_for(:item)
        post items_path({item: item_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
