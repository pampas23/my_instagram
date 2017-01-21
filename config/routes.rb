Rails.application.routes.draw do
  devise_for :users
	resources :pics do
		member do
			get :like	
		end		
	end
	root 'pics#index'
end
