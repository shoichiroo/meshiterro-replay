class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    post_comment = PostComment.new(post_comment_params)
    post_comment.user_id = current_user.id
    post_comment.post_image_id = post_image.id
    post_comment.save
    redirect_to post_image_path(post_image.id)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to post_image_path(post_image.id)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
