class Users::SearchsController < ApplicationController

  def search
    #検索条件に一致したポストモデルの取得
    @posts = Post.search(params[:search], params[:type]).page(params[:page]).per(10)
    @post = Post.search(params[:search], params[:type])
    # 検索条件で前件取得した場合
    @posts_all = @posts.all
    @post_all = @post.all
  end
end
