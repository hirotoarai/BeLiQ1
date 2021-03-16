class Users::PostCommentsController < ApplicationController

  def create
    # ポストモデルから投稿の情報を取得
    @post = Post.find(params[:post_id])
    # 空のコメントインスタンスを作成
    @post_comment = PostComment.new
    @user = current_user
    # 投稿に関連するタグを作成
    @post_tags = @post.tags
    # 空のコメントインスタンスを作成
    comment = current_user.post_comments.new(post_comment_params)
    # コメントのidが投稿のidの一致を確認
    comment.post_id = @post.id
    # もしコメントを保存できたら
    if comment.save
       # 前のページに戻る
       redirect_back(fallback_location: post_post_comments_path)
    # コメントが保存されなかった時
    else
      # エラーメッセージを表示
       redirect_to post_path(@post), notice: 'コメントは３００文字以内で投稿できます。'
    end
  end

  def destroy
  # 　ポストモデルから投稿の情報を取得
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    if post_comment.user != current_user
    end
       post_comment.destroy
       redirect_back(fallback_location: post_post_comment_path)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
