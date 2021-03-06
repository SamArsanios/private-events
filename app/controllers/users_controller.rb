class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to @user, notice: 'You have successfully signed up'
    else
      render :new, alert: 'Name has alraedy been taken'
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
      redirect_to @user, notice: 'You have successfully signed in'
    else
      render :log_in, alert: 'User does not exist'
    end
  end

  # display log in form
  def log_in; end

  def log_out
    session.delete(:id)
    session.delete(:name)
    redirect_to root_path, notice: 'You have successfully logged out'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
