require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'BiLeQ'
      end
      it 'topリンクが表示される' do
        top_link = find_all('a')[1].native.inner_text
        expect(top_link).to match(/top/i)
        #is_expected.to have_content 'top'
      end
      it 'aboutリンクが表示される' do
        about_link = find_all('a')[2].native.inner_text
        expect(about_link).to match(/about/i)
        #is_expected.to have_content 'about'
      end
      it 'ログインリンクが表示される' do
        login_link = find_all('a')[3].native.inner_text
        expect(login_link).to match(/ログイン/i)
        #is_expected.to have_content 'login'
      end
      it '新規投稿リンクが表示される' do
        signup_link = find_all('a')[4].native.inner_text
        expect(signup_link).to match(/新規登録/i)
        #is_expected.to have_content 'Sign up'
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'top画面に遷移する' do
        top_link = find_all('a')[1].native.inner_text
        top_link = top_link.delete(' ')
        top_link.gsub!(/\n/, '')
        click_link top_link
        is_expected.to eq(root_path)
      end
      it 'about画面に遷移する' do
        about_link = find_all('a')[2].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq(about_path)
      end
      it 'ログイン画面に遷移する' do
        login_link = find_all('a')[3].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq(new_user_session_path)
      end
      it '新規登録画面に遷移する' do
        signup_link = find_all('a')[4].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq(new_user_registration_path)
      end
    end
  end

  describe 'ユーザーでログインしている場合' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'ログインする'
    end

    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'マイページリンクが表示される' do
        expect(page).to have_content 'マイページ'
        mypage_link = find_all('a')[3].native.inner_text
        expect(mypage_link).to match(/マイページ/i)
      end
      it '投稿一覧リンクが表示される' do
        posts_link = find_all('a')[4].native.inner_text
        expect(posts_link).to match(/投稿一覧/i)
      end
      it 'ログアウトリンクが表示される' do
        logout_link = find_all('a')[5].native.inner_text
        expect(logout_link).to match(/ログアウト/i)
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'マイページに遷移する' do
        mypage_link = find_all('a')[3].native.inner_text
        mypage_link = mypage_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link mypage_link
        is_expected.to eq(mypage_path)
      end
      it '自分の投稿一覧画面に遷移する' do
        posts_link = find_all('a')[4].native.inner_text
        posts_link = posts_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link posts_link
        is_expected.to eq(posts_path)
      end
      it 'ログアウトする' do
        logout_link = find_all('a')[5].native.inner_text
        logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link logout_link
      end
    end
  end
end