class Users::HomesController < ApplicationController

  def top
    # ポストテーブルの全ての投稿を表示
    @posts = Post.all.page(params[:page]).per(10)
    @post = Post.all
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def about
  end
end
