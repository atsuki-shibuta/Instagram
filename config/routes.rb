Rails.application.routes.draw do 
	#routes to 'toppages#index'

	root to: 'pages#index'

	devise_for :users
	devise_scope :user do
        get '/users/sign_out' => 'devise/sessions#destroy'
        get '/users/sign_in' => 'device/sessions#create'
        get '/users/sign_in' => 'device/sessions#new'
    end

    
    resources :like, only: %i(create destroy) do
    end

    resources :posts, only: %i(new create index destroy) do
        get 'like' => 'like#create'
        get 'unlike' => 'like#destroy'
        resources :photos, only: %i(create)
        resources :comments, only: %i(create destroy)
    end

    resources :users, only: [:index, :show, :new, :create] do
	    member do
	      # get :followings
	      # get :followers
	       get :likes
	    end
  	end
end