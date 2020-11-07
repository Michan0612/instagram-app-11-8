require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user)}
  context '内容が入力されている場合' do
    it 'photosにレコードが存在する' do
      expect(item).to be_valid
    end
  end
end
