Rails.application.routes.draw do
	match 'events' => "events#index", via: :options

	namespace :api, path: '/', 
		constraints: { subdomain: 'api' },
		defaults: { format: :json }do
		namespace :v1 do
			resources :events, only: [:create]
		end
	end
end
