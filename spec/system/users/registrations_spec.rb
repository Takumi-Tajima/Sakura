require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :system do
  describe 'ユーザーの新規登録' do
    it 'ユーザーの新規登録ができ、そのアカウントでログインできること' do
      visit new_user_registration_path

      expect(page).to have_content '新規登録'

      fill_in '名前', with: '田中太郎'
      fill_in 'メールアドレス', with: 'tanaka@exmaple.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認用）', with: 'password'

      click_on '登録する'

      expect(page).to have_content 'ログインもしくはアカウント登録してください。'

      email = open_last_email

      click_first_link_in_email(email)

      expect(page).to have_content 'メールアドレスが確認できました。'

      expect(email.subject).to eq 'メールアドレス確認メール'

      expect(page).to have_selector 'h1', text: 'ログイン'
      expect(page).to have_content 'メールアドレスが確認できました。'

      fill_in 'メールアドレス', with: 'tanaka@exmaple.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'

      within '.navbar' do
        expect(page).to have_content '田中太郎'
        expect(page).to have_button 'ログアウト'
      end
    end
  end

  describe 'ユーザー情報編集画面へのリンクと、ユーザー情報の編集機能' do
    let(:user) { create(:user, name: '吉田健', email: 'yoshida@exmaple.com', password: 'password') }

    before { sign_in user }

    it 'ヘッダーにある名前のリンクを押すと、ユーザーの編集画面に遷移すること' do
      visit root_path

      within '.navbar' do
        click_link '吉田健'
      end

      expect(page).to have_selector 'h1', text: 'ユーザー情報の編集'
      expect(page).to have_field '名前', with: '吉田健'
    end
  end
end
