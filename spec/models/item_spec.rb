require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:user) { create(:user) }
  include ActionDispatch::TestProcess

    context '内容が入力されている場合' do
      describe '#photos' do
        subject { create(:item).photos }
        it { is_expected.to be_an_instance_of(ActiveStorage::Attached::Many) }
      end

      # before do
      #   @item = build(:item, user: user)
      # end

      # it 'is valid with an image' do
      #   expect(@item).to be_valid
      # end
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
