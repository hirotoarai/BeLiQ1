class Users::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @user = User.find(params[@post.user_id])
    post_comment = @post.post_comments.find(params[:id])
    if post_comment.user != current_user
    end
       post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
