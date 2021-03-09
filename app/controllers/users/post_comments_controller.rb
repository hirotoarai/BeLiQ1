class Users::PostCommentsController < ApplicationController

  def create
    # ポストモデルから投稿の情報を取得
    @post = Post.find(params[:post_id])
    # 空のコメントインスタンスを作成
    @post_comment = PostComment.new
    @user = current_user
    @post_tags = @post.tags
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    if comment.save
       redirect_back(fallback_location: post_post_comments_path)
    else
       redirect_to post_path(@post), notice: 'コメントは３００文字以内で投稿できます。'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    #@user = User.find(params[@post.user_id])
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
