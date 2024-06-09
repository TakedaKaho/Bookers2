class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest#guestは元々あるメソッドではなく下で定義
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
  end
  
end