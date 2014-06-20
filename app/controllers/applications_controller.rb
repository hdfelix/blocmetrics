class ApplicationsController < ApplicationController
	def index
		@events = Event.all


		@events_for_graph = [] #temp for testing
		@graph_labels = []
		@referers = []
		@all_referers = []
		@events.all.each do |event|
			unless event.referer == nil	
				@all_referers << event.referer
				@graph_labels << event.referer
				#@events_for_graph << event unless %w(1 2 3 4 5).include?(event.property_1)
			end

		 end

		@all_referers = @all_referers.uniq

		i = 0
		@all_referers.each do |referer|
			@referers << [referer,i]
			i += 1
		end
	end
end
