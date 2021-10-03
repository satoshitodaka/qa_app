require 'rails_helper'

describe "Questions", type: :system do
  describe '質問の一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, nickname: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:question, title: 'ユーザーAの質問', user: user_a)
    end
    context 'ユーザーがログインしている時' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end

      it '一覧に質問が表示される' do
        expect(page).to have_content 'ユーザーAの質問'
      end
    end

    context '未ログインユーザーの時' do
    end
  end
end
