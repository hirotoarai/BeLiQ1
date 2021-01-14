class Users::SearchsController < ApplicationController

  def search
    #検索条件に一致したポストモデルの取得
    @posts = Post.search(params[:search], params[:type]).page(params[:page]).per(10)
    @post = Post.search(params[:search], params[:type])
    @posts_all = @posts.all
    @post_all = @post.all
  end
end
