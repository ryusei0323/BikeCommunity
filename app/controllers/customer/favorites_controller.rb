class Customer::FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    #いいねボタンを連打しても1回しかいいね出来ない様に条件付与
    unless @post.favorited_by?(current_user)
      favorite = current_user.favorites.new(post_id: @post.id)
      favorite.save
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

end
