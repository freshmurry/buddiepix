class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @users = User.search(params[:term])
    respond_to :js
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    set_meta_tags title: @user.name
    @posts = @user.posts.includes(:photos, :likes, :comments)
    @saved = Post.joins(:bookmarks).where("bookmarks.user_id=?", current_user.id).
      includes(:photos, :likes, :comments) if @user == current_user
  end
  
  # def edit
  # end

  # def update
  #   current_user.update(user_params)
  #   redirect_to current_user
  # end
  
  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.
  
  def user_params
    params.require(:user).permit(:image, :image_file_name)
  end
end