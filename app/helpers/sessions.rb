helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    if session[:id]
      current_user = User.find(session[:id])
    end
    current_user
  end

end
