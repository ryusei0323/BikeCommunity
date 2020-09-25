class Admin::PostsController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = '投稿を更新しました'
      redirect_to admin_post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_post_path
  end

  private
  def post_params
    params.require(:post).permit(:post_title, :post_sentence, :post_image)
  end
end
