Rails.application.routes.draw do
	post 'auth/register', to: 'users#create'
	post 'auth_user', to: 'authentication#create'
	post 'hastoken', to: 'authentication#hastoken'
	post 'contacts', to: 'contacts#index'
	
	resources :users, :contacts

end
