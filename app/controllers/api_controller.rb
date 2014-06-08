class ApiController < ActionController::Base

	# Necessary in all controllers that will respond with JSON
	respond_to :json

	# Error responses and before_filter blocking work directly with javascript requests.
	# Rather than using befolr_filters to authentication actions, you should use
	# "guard clauses" like `permission_denied_error unless condition`
	def permsission_denied_error
		error(403,'Permission denied!')
	end

	def error(status, message = 'Something went wrong')
		response = {
			response_type: "ERROR",
			message: message
		}

		render json: response.to_json, status: status
	end
end
