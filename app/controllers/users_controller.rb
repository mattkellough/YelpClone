class UsersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update, :destroy]

def index
end

def show
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)

  if @user.save
    session[:user_id] = @user.id
    redirect_to root_url, notice: 'User was successfully created.'
  else
    render 'new'
  end
end

def edit
  session[:user_id] = @user.id
end

def update
  if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
end

def destroy
end



  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profilepicture, :email, :avatar, :password, :password_confirmation)
  end

end
