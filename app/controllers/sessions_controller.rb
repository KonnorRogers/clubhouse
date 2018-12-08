# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user&.authenticate(params[:session][:password])
      login(@user)
      flash.now[:notice] = 'Congratulations! Sign in successful!'
      # redirect_to(sessions_path)
      # redirect_to(@user)
      render 'new'
    else
      flash.now[:danger] = 'Sign in unsuccessful, please try again'
      render 'new'
    end
  end

  def destroy
    logout
    flash.now[:notice] = 'Successfully logged out'
  end

  def index; end
end
