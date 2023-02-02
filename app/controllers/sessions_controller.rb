class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email]) || User.find_by(phone_number: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, #{user.email}"
    else
      flash.now[:alert] = "Incorrect email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Goodbye!"
  end
end