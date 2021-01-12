require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'
      end
      it '新規登録に失敗する' do
        fill_in 'user[name]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button '新規登録'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_user) { user }
      it 'ログインに成功する' do
        fill_in 'user[name]', with: test_user.name
        fill_in 'user[password]', with: test_user.password
        click_button 'ログインする'
      end

      it 'ログインに失敗する' do
        fill_in 'user[name]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログインする'
      end
    end
  end
end

describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let!(:test_user2) { create(:user) }
  let!(:post) { create(:post, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログインする'
  end

  describe '編集のテスト' do
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        visit edit_user_path(user)
        expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
      end
    end

    context '表示の確認' do
      before do
        visit edit_user_path(user)
      end
      it 'ユーザー編集と表示される' do
        expect(page).to have_content('ユーザー編集')
      end
      it '名前編集フォームに自分の名前が表示される' do
        expect(page).to have_field 'user[name]', with: user.name
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[profile_image]'
      end
      it '自己紹介編集フォームに自分の自己紹介が表示される' do
        expect(page).to have_field 'user[introduction]', with: user.introduction
      end
      it '編集に成功する' do
        click_button '変更する'
        expect(current_path).to eq('/mypage')
      end
      it '編集に失敗する' do
        fill_in 'user[name]', with: ''
        click_button '変更する'
        expect(current_path).to eq('/mypage')
      end
    end
  end

  describe '詳細画面のテスト' do
    before do
      visit mypage_path
    end
    context '表示の確認' do
      it 'マイページと表示される' do
        expect(page).to have_content('マイページ')
      end
      it 'タイトルフォームが表示される' do
		  	expect(page).to have_field 'post[title]'
		  end
		  it '内容フォームが表示される' do
		  	expect(page).to have_field 'post[body]'
		  end
		  it '投稿するボタンが表示される' do
		  	expect(page).to have_button '投稿する'
		  end
		  it '投稿に成功する' do
		  	fill_in 'post[title]', with: Faker::Lorem.characters(number:5)
		  	fill_in 'post[body]', with: Faker::Lorem.characters(number:20)
		  	click_button '投稿する'
		  end
		  it '投稿に失敗する' do
		  	click_button '投稿する'
		  	expect(current_path).to eq('/mypage')
		  end
    end
  end
end