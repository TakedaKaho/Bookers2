class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  def create
    @user = User.new
  end
    
  def index
    @users = User.all
  end 
  
  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end 
  
  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @book = @user.books
    @user = User.find(params[:id])
    @books = @user.books
  end 

  
  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id) 
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
end 