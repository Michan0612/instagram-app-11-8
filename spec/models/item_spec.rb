require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:user) { create(:user) }
  include ActionDispatch::TestProcess

    context '内容が入力されている場合' do
     

      before do
        @item = build(:item, user: user)
        @item.photos = fixture_file_upload(Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'images', 'avatar1.png'), 'image/png'))
      end

      it 'is valid with an image' do
        expect(@item).to be_valid
      end
    end

  # context '内容の文字が一文字の場合' do
  #   let!(:post) { build(:post, content: Faker::Lorem.characters(number: 1), user: user) }

  #   before do
  #     post.save
  #   end

  #   it '記事を保存できない' do
  #     expect(post.errors.messages[:content][0]).to eq('is too short (minimum is 2 characters)')
  #   end
  # end
end
