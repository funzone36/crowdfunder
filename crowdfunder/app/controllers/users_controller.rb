class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
