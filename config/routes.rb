Rails.application.routes.draw do
	post 'auth/register', to: 'users#register'
	post 'auth_user' => 'authentication#create'
	get 'home' => 'home#index'
	resources :users

end
