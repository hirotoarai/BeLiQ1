class Users::FavoritesController < ApplicationController

  def create
    # ポストモデルからポストidを取得
    @post = Post.find(params[:post_id])
    # 空のインスタンスを作成
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    # ポストモデルからポストidを取得
    @post = Post.find(params[:post_id])
    # 空のインスタンスを作成
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end
end
