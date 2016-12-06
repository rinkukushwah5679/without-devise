Rails.application.routes.draw do
  resources :blogs
  # get 'pages/index'
  resources :comments
  resources :pages
  resources :users do
  	resources :comments
  	collection do
     get :sign_in
     post :session_create
     delete :session_destroy
    end
  end

  get 'create_comment' => 'users#create_comment', as: :create_comment
  get 'like' => 'comment#like', as: :like
  get 'unlike' => 'comment#unlike', as: :unlike
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
