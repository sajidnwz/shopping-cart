Rails.application.routes.draw do


resources :products do 
	member do 
		put :approve
			
	end

	collection do 
		get :featured_products
	end
end

root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
