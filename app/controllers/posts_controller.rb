# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    @post.user = current_user
    if @post.save
      redirect_to(posts_path)
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please login'
    redirect_to(login_url)
  end

  def user_params
    params.require(:post).permit(:title, :text)
  end
end
