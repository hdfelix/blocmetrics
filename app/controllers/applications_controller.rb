class ApplicationsController < ApplicationController
	def index
		@events = Event.all
	end
end
