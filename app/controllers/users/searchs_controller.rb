class Users::SearchsController < ApplicationController

  def search
    #検索条件に一致したポストモデルの取得
    @posts = Post.search(params[:search], params[:type]).page(params[:page]).per(10)
  end
end
