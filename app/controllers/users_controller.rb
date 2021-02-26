class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def sign_in
    @user = User.find_by(name: params[:name])

    if @user
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to @user
    else
      render :sign_in
    end
  end

  # display log in form
  def log_in; end

  def log_out
    session.delete(:id)
    session.delete(:name)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
