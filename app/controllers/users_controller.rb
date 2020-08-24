class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:name, :email, :password, :password_confirmation)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email))
        redirect_to posts_path
    else
        render :edit
    end
  end

end
