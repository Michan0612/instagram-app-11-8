require 'rails_helper'

RSpec.describe 'Item', type: :system do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }

  context 'ログインしている場合' do
    before do
        sign_in user
    end
    it '記事詳細を表示できる' do
      visit item_path(item.id)

      click_on 'Items'

      expect(page).to have_content('Posts')
      expect(page).to have_css('.profile-string', text: 'Followers')
    end
  end
end
