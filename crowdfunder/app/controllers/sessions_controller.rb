class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      session[:user_id] = user.id
      redirect_to projects_path
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
