# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def login(user)
    session[:user_id] = user.id
    remember(user)
  end

  def remember(user)
    #user.remember # updates database with remember_digest
    cookies.permanent[:remember_token] = user.remember_token
  end

  # returns current logged in user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies[:remember_token])
      user = User.find_by(remember_digest: User.digest(user_id))
      login(user)
      @current_user = user
    end
  end
end
