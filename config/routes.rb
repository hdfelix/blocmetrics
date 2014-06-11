Rails.application.routes.draw do
	#match 'v1/events' => "api/v1/events#index", via: :options
  #match 'api/v1/events' => "api/v1/events#create", via: :post
	
  namespace :api do
		namespace :v1 do
			match 'events' => 'events#index', via: :options
			resources :events, only: [:show, :index, :create]
		end
	end

	root to: 'applications#index'
end
