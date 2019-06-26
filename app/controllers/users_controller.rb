class UsersController < ApplicationController
  def new

  end

  def create
    unless (user_params[:password] == user_params[:password_confirmation])
      flash[:error] = "passwords do not match!"
      redirect_to signup_path
    end

    email = user_params[:email]
    password = user_params[:password]
    name = user_params[:name]

    u = User.new.create({
      name: name,
      email: email,
      password: password
    })
    session[:user_id] = u.id
    session[:user_name] = u.name
    session[:user_email] = u.email

  rescue EmailTakenError
    flash[:error] = "email address #{email} is already in use!"
    redirect_to signup_path
  else
    render "games/index"
  end

  def user_params
    params.require(:user_data).permit(:email, :password, :password_confirmation)
  end
  class EmailTakenError < StandardError; end

end