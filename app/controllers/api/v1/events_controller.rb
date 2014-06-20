class API::V1::EventsController < ApiController

before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers

	def index
		@events = Event.all
	  respond_with (@events)

	end

	def create
		binding.pry
		@event = Event.new(JSON.parse(params[:event].to_json))
		if @event.save
			respond_with @event, location: api_v1_event_path(@event)
		else
			render json: {:error => "Invalid event"}, status: :unprocessable_entity 
		end
	end

	private
	
	def event_params
		binding.pry
		params.require(:event).permit(:referer, :name, :property_1, :property_2)
	end

	def cors_set_access_control_headers
		headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
		headers['Access-Control-Headers'] = 'Content-Type'
    headers['Access-Control-Max-Age'] = "1728000"
		#headers['Access-Control-Allow-Credentials'] = 'true'
	end

	def cors_preflight_check 
		headers["Access-Control-Allow-Origin"] = "*"
		headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
		headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
	end
end
