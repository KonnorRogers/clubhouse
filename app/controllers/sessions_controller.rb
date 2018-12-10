# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to(@user)
    end
  end

  def create
    login if logged_in? == false

    if logged_in? == true
      flash[:notice] = 'Successful login'
      redirect_to(@user)
    else
      flash.now[:danger] = 'Unsuccessful login'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:notice] = 'Successfully logged out'
    redirect_to(root_url)
  end
end
