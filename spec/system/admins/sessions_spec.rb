require 'rails_helper'

RSpec.describe '管理者ログイン機能', type: :system do
  context 'ログインしていないとき' do
    before do
      create(:admin, email: 'test@example.com', password: 'password')
    end

    it 'ログインができること' do
      visit new_admin_session_path

      expect(page).to have_content 'ログイン'

      fill_in 'メールアドレス',	with: 'test@example.com'
      fill_in 'パスワード',	with: 'password'

      click_button 'ログイン'

      expect(page).to have_content 'ログインしました。'
      expect(page).to have_content 'Sakura Market for Admin'
    end
  end

  context 'ログインしているとき' do
    let(:admin) { create(:admin) }

    before { sign_in admin }

    it 'ログアウトできること' do
      visit admins_root_path

      expect(page).to have_content 'Sakura Market for Admin'

      click_button 'ログアウト'

      expect(page).to have_content 'ログアウトしました。'
    end

    it '管理者ログイン画面にアクセスできないこと' do
      visit new_admin_session_path

      expect(page).to have_content 'Sakura Market for Admin'
      expect(page).to have_content 'すでにログインしています。'
      expect(page).not_to have_field 'メールアドレス'
      expect(page).not_to have_field 'パスワード'
    end
  end
end
