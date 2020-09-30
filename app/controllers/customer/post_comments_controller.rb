class Customer::PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to customer_post_path(post)
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to customer_post_path(params[:post_id])
  end

  def post_comment_params
    params.require(:post_comment).permit(:user_id, :post_image_id, :comment)
  end
end
