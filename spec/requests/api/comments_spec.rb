require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }
  let!(:comment) { create(:comment, item: item, user: user) }
  describe 'GET /comments' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '200 Status' do
        get item_comments_path(item_id: item.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /comments" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it 'コメントが保存される' do
        comment_params = attributes_for(:comment)
        post item_comments_path(item_id: item.id, comment: comment_params)
        expect(response).to have_http_status(200)
        
        body = JSON.parse(response.body)
        expect(body['content']).to eq(comment_params[:content])
      end
    end
  end
end
