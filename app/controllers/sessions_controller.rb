class SessionsController < ApplicationController
  def new

  end

  def create
    u = User.new.from_email(session_params[:email])
    if u.nil?
      flash[:error] = "Email not found! Try signing in again or sign up with this email."
      redirect_to login_path and return
    end

    session[:user_id] = u.id
    session[:name] = u.name
    session[:email] = u.email
    redirect_to games_path
  end

  def session_params
    params.require(:user_data).permit(:email, :password)
  end
end