class SessionsController < ApplicationController
  
  skip_before_filter :authorize

  def new
    session[:previous] = request.referer
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      if session[:previous] != nil
      redirect_to session[:previous]
      else
        redirect_to characters_path
      end
    else
      redirect_to login_url, :alert => "Invalid username/password combination."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to characters_path, :notice => "Logged Out"
  end
end
