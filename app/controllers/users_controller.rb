class UsersController < ApplicationController
    
  def index
    #@books = User.find(params[:id])
    @user = User.all #allでいいのか
    @books = @user.name#いろんなユーザーのプロフィール画像と名前だけ出したい
  end 
  def edit
  end 
  
  def show
  end 

  def update
  end
  
end 