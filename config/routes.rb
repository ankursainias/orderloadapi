require 'api_constraints'
Rails.application.routes.draw do

    devise_for :users
    resources :posts
    resources :items
	resources :feeds
	resources :orders
	 # API routes 
	namespace :api, defaults: { format: :json } do
	  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
	        resources :testing, only: [] do
		        collection do
		        	post "create_order"
		        	get "since_orders"
		        	get "deliveries"
		        	get "deliveries_order_for_kitchen"
		        end
		        member do
		        	get "order"
		        	put "order_update"
		        	get "last_mile_data"
		        end
      		end
			resources :users, only: [] do
            	collection do
					post 'login'
					delete 'logout'
            	end
      		end
		end
	end
end
