Rails.application.routes.draw do
  root 'posts#index'
  
  get 'search' => 'search#index'


  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  # get '/users/:id', to: 'users#show'
  # /users/3 -> Users controller, show action, params {id: '3'}

  resources :users, only:[:index, :show]

  # post 'follow' => 'follows#create'
  # delete 'unfollow' => 'follows#destroy'
  
  post 'follows' => 'follows#create'
  delete 'unfollow' => 'follows#destroy'

  get "about" => "pages#about" #creates about_path
  get "support" => "pages#support"
  get "blog" => "pages#blog"
  get "press" => "pages#press"
  get "careers" => "pages#careers"
  get "privacy" => "pages#privacy"
  get "terms" => "pages#terms"
  get "faq" => "pages#faq"

  resources :posts, only: [:index, :show, :create, :edit, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
    resources :bookmarks, only: [:create, :destroy], shallow: true
  end
end