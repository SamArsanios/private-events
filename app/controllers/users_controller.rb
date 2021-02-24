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

    private user_params
        params.require(:user).permit(:name)
    end
end
