require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }
  let!(:post2) { create(:post, user_id: user2.id) }
  before do
  	visit new_user_session_path
  	fill_in 'user[name]', with: user.name
  	fill_in 'user[password]', with: user.password
  	click_button 'ログインする'
  end

  describe '詳細画面のテスト' do
  	context '自分・他人共通の投稿詳細画面の表示を確認' do
  		it '投稿詳細と表示される' do
  			visit post_path(post)
  			expect(page).to have_content '投稿詳細'
  		end
  		it 'ユーザー画像・名前のリンク先が正しい' do
  			visit post_path(post)
  			expect(page).to have_link post.user.name, href: user_posts_path(user)
  		end
  		it '投稿のタイトルが表示される' do
  			visit post_path(post)
  			expect(page).to have_content post.title
  		end
  		it '投稿の内容が表示される' do
  			visit post_path(post)
  			expect(page).to have_content post.body
  		end
  	end
  	context '自分の投稿詳細画面の表示を確認' do
  		it '投稿の編集リンクが表示される' do
  			visit post_path(post)
  			expect(page).to have_link '編集する', href: edit_post_path(post)
  		end
  		it '投稿の削除リンクが表示される' do
  			visit post_path(post)
  			expect(page).to have_link '削除する', href: post_path(post)
  		end
  	end
  	context '他人の投稿詳細画面の表示を確認' do
  		it '投稿の編集リンクが表示されない' do
  			visit post_path(post2)
  			expect(page).to have_no_link '編集する', href: edit_post_path(post2)
  		end
  		it '投稿の削除リンクが表示されない' do
  			visit post_path(post2)
  			expect(page).to have_no_link '削除する', href: post_path(post2)
  		end
  	end
  end

  describe '編集のテスト' do
  	context '自分の投稿の編集画面への遷移' do
  	  it '遷移できる' do
	  		visit edit_post_path(post)
	  		expect(current_path).to eq('/posts/' + post.id.to_s + '/edit')
	  	end
	  end
		context '表示の確認' do
			before do
				visit edit_post_path(post)
			end
			it '投稿編集と表示される' do
				expect(page).to have_content('投稿編集')
			end
			it 'タイトル編集フォームが表示される' do
				expect(page).to have_field 'post[title]', with: post.title
			end
			it '投稿内容編集フォームが表示される' do
				expect(page).to have_field 'post[body]', with: post.body
			end
		end
		context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_post_path(post)
				click_button '編集する'
				expect(current_path).to eq '/posts/' + post.id.to_s
			end
			it '編集に失敗する' do
				visit edit_post_path(post)
				fill_in 'post[title]', with: ''
				click_button '編集する'
				expect(current_path).to eq '/posts/' + post.id.to_s
			end
		end
	end
end