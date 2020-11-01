require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user)}
  context '内容が入力されている場合' do

    it 'photosにレコードが存在する' do
      expect(item).to be_valid
    end
  end

  # let!(:user) { create(:user) }
  # subject { create(:item, user: user).photos }

  # it { is_expected.to be_an_instance_of(ActiveStorage::Attached::Many) }



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
