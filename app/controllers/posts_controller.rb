class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
  end

  def index
    @posts = Post.all
  end

  private

  def logged_in_user
    return if logged_in?

    flash[:danger] = "Please login"
    redirect_to(login)
  end
end
