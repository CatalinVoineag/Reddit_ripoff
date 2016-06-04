Rails.application.routes.draw do
  
  get 	 'login' 	=> 'sessions#new'
  post 	 'login'	=> 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'static_pages#index'

  resources :users
  resources :links do 
  	get 'up', to: 'links#up', as: :up
  	get 'down', to: 'links#down', as: :down
  	post 'comment', to: 'links#comment', as: :comment
  end

  resources :votes, only: [:new, :create, :edit, :destroy]

end
