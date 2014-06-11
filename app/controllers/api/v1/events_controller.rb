class API::V1::EventsController < ApiController

before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers

	def index
		@events = Event.all
	  respond_with (@events)

	end

	def create
		@event = Event.new(JSON.parse(params[:event]))
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
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
		headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
		headers['Access-Control-Max-Age'] = '1728000'
		#headers['Access-Control-Allow-Credentials'] = 'true'
		#render :text => '', :content_type => 'text/plain'
	end
end
