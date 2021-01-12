require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }
  let!(:post2) { create(:post, user_id: user2.id) }
  before do
    # byebug
  	visit new_user_session_path
  	fill_in 'user[name]', with: user.name
  	fill_in 'user[password]', with: user.password
  	click_button 'ログインする'
  end

describe 'top画面のテスト' do
  	before do
  		visit root_path
  	end
  	context '表示の確認' do
  	  it '投稿一覧と表示される' do
  			expect(page).to have_content '投稿一覧'
  		end
  		it '自分と他人の画像のリンク先が正しい' do
  			expect(page).to have_link '', href: user_posts_path(post.user_id)
  			expect(page).to have_link '', href: user_posts_path(post2.user_id)
  		end
  		it '自分と他人のタイトルのリンク先が正しい' do
  			expect(page).to have_link post.title, href: post_path(post)
  			expect(page).to have_link post2.title, href: post_path(post2)
  		end
  	end
  end
end