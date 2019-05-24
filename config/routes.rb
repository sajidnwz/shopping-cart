Rails.application.routes.draw do

  
devise_for :users
resources :orders  
resources :line_items
resources :carts
resources :products do 
	member do 
		put :approve
			
	end

	collection do 
		get :featured_products
	end
end

root :to => 'store#index', :as => 'store'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
