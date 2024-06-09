Rails.application.routes.draw do
 
    root to: "homes#top"
    get '/home/about', to: 'homes#about', as: 'about'
    devise_for :users
    devise_scope :user do
      post "users/guest_sign_in", to: "users/sessions#guest_sign_in"#sessionscontrollerで定義したメソッドはto後ろに保存するよってこと
    end
    
    resources :books, only:[:new, :index, :show, :edit, :create, :destroy, :update]
    resources :users, only:[:index, :edit, :update, :show, :create]

 end

