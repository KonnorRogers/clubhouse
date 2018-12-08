# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def login(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember # updates database with remember_digest
    cookies.permanent[:remember_token] = user.remember_token
  end

  # returns current logged in user
  def current_user
    if (user = session[:user_id])
      @current_user ||= User.find_by(id: user)
    elsif (token = cookies[:remember_token])
      @current_user ||= User.find_by(remember_digest: User.digest(token))
      login(@current_user)
    end
  end
end
