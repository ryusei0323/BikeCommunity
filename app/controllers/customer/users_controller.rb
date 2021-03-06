class Customer::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @favorite_posts = @user.favorite_posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to customer_user_path(@user)
    else
      render "edit"
    end
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(user_status: "退会済")
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :account_name, :profile_sentence, :profile_image_id, :user_status)
  end
end
