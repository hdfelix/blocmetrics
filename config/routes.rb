Rails.application.routes.draw do
	match 'events' => "events#index", via: :options
end
