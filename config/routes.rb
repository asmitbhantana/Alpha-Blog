Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'welcome#index'

	get 'articles/new',to: 'articles#new'
	resources :articles
	
	get 'signup',to:'users#new'
	resources :users , except: [:new]
	
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
