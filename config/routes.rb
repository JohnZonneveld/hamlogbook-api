Rails.application.routes.draw do
	post 'auth/register', to: 'users#create'
	post 'auth_user', to: 'authentication#create'
	post 'hastoken', to: 'authentication#hastoken'
	patch 'users/:id', to: 'users#update'
	get 'contacts/:id', to: 'contacts#show'
	patch 'contacts/:id', to: 'contacts#update'
	post 'contacts', to: 'contacts#create'
	delete 'contacts/:id', to: 'contacts#destroy'
	get 'contacts', to: 'contacts#index'
end
