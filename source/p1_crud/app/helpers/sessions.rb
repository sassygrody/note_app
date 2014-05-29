helpers do

  def give_session
    session[:user_id] = @user.id
  end

  def current_user
    return nil if session[:user_id].nil?
    @user ||= User.find(session[:user_id])
  end

  def check_user
    session[:messages] = ["Please LOG IN to continue."]
    redirect to '/' unless current_user
  end

end