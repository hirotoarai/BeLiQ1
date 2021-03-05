class Users::FollowRelationshipsController < ApplicationController

  def create
    # フォローリレーションシップテーブルからフォローid情報を取得
    @user = User.find(params[:follow_relationship][:following_id])
    # フォローをする機能を追加
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  def destroy
    # フォローリレーションシップテーブルからフォローid情報を取得
    @user = User.find(params[:follow_relationship][:following_id])
    # フォローを外す機能を追加
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end
end
