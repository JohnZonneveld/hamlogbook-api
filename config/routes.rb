Rails.application.routes.draw do
	# post 'auth/register', to: 'users#register'
	post 'auth_user', to: 'authentication#create'
	post 'hastoken', to: 'authentication#hastoken'
	
	get 'home' => 'home#index'
	resources :users

end
