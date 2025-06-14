require 'rails_helper'

RSpec.describe '食材の機能', type: :system do
  let(:admin) { create(:administrator) }

  before { sign_in admin }

  describe 'データ表示' do
    before do
      create(:food, name: 'いちご大福', description: '新鮮ないちごを使用した人気の和菓子', price: 350, is_published: true)
    end

    it '食材のデータが表示されること' do
      visit admins_foods_path

      expect(page).to have_content('いちご大福')
      expect(page).to have_content('350円')
      expect(page).to have_content('公開中')

      click_on 'いちご大福'

      expect(page).to have_selector('h1', text: 'いちご大福')
      expect(page).to have_content('新鮮ないちごを使用した人気の和菓子')
    end
  end

  describe '新規登録' do
    it '新規登録できること' do
      visit new_admins_food_path

      expect(page).to have_selector('h1', text: '食材新規登録')

      fill_in '名前', with: '抹茶ロールケーキ'
      fill_in '価格', with: '480'
      check '公開する'

      expect do
        click_on '登録する'
        expect(page).to have_content('食品を作成しました。')
      end.to change(Food, :count).by(1)

      expect(page).to have_content('抹茶ロールケーキ')
      expect(page).to have_content('480')
      expect(page).to have_content('公開中')
    end

    it 'バリデーションエラーがある場合は登録されないこと' do
      visit new_admins_food_path

      expect(page).to have_selector('h1', text: '食材新規登録')

      fill_in '名前', with: ''
      fill_in '価格', with: '0'

      expect do
        click_on '登録する'
      end.not_to change(Food, :count)

      expect(page).to have_content('名前を入力してください')
      expect(page).to have_content('価格は1以上の値にしてください')
    end
  end

  describe '編集' do
    before do
      create(:food, name: 'どら焼き', price: 280, is_published: false)
    end

    it '編集できること' do
      visit admins_foods_path

      expect(page).to have_content('どら焼き')
      expect(page).to have_content('280円')
      expect(page).to have_content('非公開')

      click_on '編集'

      fill_in '名前', with: '特製どら焼き'
      fill_in '価格', with: '320'
      check '公開する'

      click_on '更新する'

      expect(page).to have_content('食品を更新しました。')
      expect(page).to have_content('特製どら焼き')
      expect(page).to have_content('320円')
      expect(page).to have_content('公開中')
    end
  end

  describe '削除' do
    before { create(:food, name: '桜餅') }

    it '削除できること' do
      visit admins_foods_path

      expect(page).to have_content('桜餅')

      expect do
        accept_confirm do
          click_on '削除'
        end
        expect(page).to have_content('食品を削除しました。')
      end.to change(Food, :count).by(-1)

      expect(page).not_to have_content('桜餅')
    end
  end
end
