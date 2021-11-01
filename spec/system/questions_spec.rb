require 'rails_helper'

describe "Questions", type: :system do
  let(:user_a){ FactoryBot.create(:user, nickname: 'ユーザーA', email: 'a@example.com') }
  let!(:question_a){ FactoryBot.create(:question, title: 'ユーザーAの質問', question_body: 'hogehoge', user: user_a) }

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログイン'
  end

  shared_examples_for 'ユーザーAの質問タイトルが表示される' do
    it { expect(page).to have_content 'ユーザーAの質問' }
  end

  shared_examples_for 'ユーザーAの質問内容が表示される' do
    it { expect(page).to have_content 'hogehoge' }
  end

  describe '質問の一覧表示機能' do
    context 'ユーザーがログインしている時' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAの質問タイトルが表示される'
    end

    context '未ログインユーザーの時' do
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit question_path(question_a)
      end

      it_behaves_like 'ユーザーAの質問タイトルが表示される'
      it_behaves_like 'ユーザーAの質問内容が表示される'
    end
  end

  describe '新規作成機能' do
    let(:login_user) { user_a }

    before do
      visit new_question_path
      fill_in 'タイトル', with: question_title
      fill_in 'question[question_body]', with: question_body
      click_button '登録する'
    end

    context 'タイトルと質問内容を入力した時' do
      let(:question_title) { '最初の質問' }
      let(:question_body) { '最初の質問について教えてください。' }

      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: '最初の質問'
      end
    end

    context 'タイトルのみ入力した時' do
      let(:question_title) { '最初の質問' }
      let(:question_body) { '' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content '質問内容を入力してください'
        end
      end
    end

    context '質問内容のみ入力した時' do
      let(:question_title) { '' }
      let(:question_body) { '最初の質問について教えてください。' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content 'タイトルを入力してください'
        end
      end
    end

  end
end
