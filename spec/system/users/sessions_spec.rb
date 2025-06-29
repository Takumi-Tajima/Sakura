require 'rails_helper'

RSpec.describe 'ユーザーのログイン機能', type: :system do
  context 'ログインしてない時' do
    before do
      create(:user, name: '田島 匠', email: 'takumi@exmaple.com', password: 'password123')
    end

    it 'ログインができること' do
      visit new_user_session_path

      expect(page).to have_selector 'h1', text: 'ログイン'

      fill_in 'メールアドレス', with: 'takumi@exmaple.com'
      fill_in 'パスワード', with: 'password123'
      click_button 'ログイン'

      expect(page).to have_content 'ログインしました。'

      within '.navbar' do
        expect(page).to have_content '田島 匠'
        expect(page).to have_button 'ログアウト'
      end
    end
  end

  context 'ログインしている時' do
    let(:user) { create(:user, name: '前田直輝') }

    before { sign_in user }

    it 'ログアウトできること' do
      visit root_path

      expect(page).to have_content 'Sakura Market'

      within '.navbar' do
        expect(page).to have_content '前田直輝'
        expect(page).to have_button 'ログアウト'
      end

      within '.navbar' do
        click_button 'ログアウト'
      end

      within '.navbar' do
        expect(page).not_to have_content '前田直輝'
        expect(page).not_to have_button 'ログアウト'
      end
    end

    it 'ログイン画面にアクセスできないこと' do
      visit new_user_session_path

      expect(page).to have_content 'すでにログインしています。'
      expect(page).to have_content 'Sakura Market'
    end
  end
end
