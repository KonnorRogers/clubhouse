module SessionsHelper
  def session_login(user)
    session[:user_id] = user.id
  end

  def login
    @user = User.find_by(email: params[:session][:email])
    # same as @user && @user.authenticate
    if @user&.authenticate(params[:session][:password])
      session_login(@user)
      remember(@user)
      return true
    end

    false
  end

  def current_user
    # if the session has been set & current user nil, use this
    if (user_id = session[:user_id])
      @user ||= User.find_by(id: user_id)
    # use this if session is nil, user not logged in yet
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      # Then compares users remember_digest to User.digest(remember_token)
      if user.remember_digest == User.digest(cookies[:remember_token])
        session_login(user)
        @user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(user)
    user.update_attribute(:remember_digest, User.digest(User.create_token))
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.update_attribute(:remember_digest, nil) # sets remember_digest to nil
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logout
    forget(current_user)
    session.delete(:user_id)
    @user = nil
  end
end
