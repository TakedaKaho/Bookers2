class UsersController < ApplicationController
  
  def create
    @user = User.new
  end
    
  def index
    @users = User.all
  end 
  
  def edit
    @user = User.find(params[:id])
  end 
  
  def show
    @user = User.find(params[:id])
  end 
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id) 
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  end 