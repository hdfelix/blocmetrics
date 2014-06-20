class ApplicationsController < ApplicationController
	def index
		@events = Event.all
		@referers = []
		@all_referers = []
		@events.all.each do |event|
			unless event.referer == nil	
				@all_referers << event.referer
			end
		 end

		@all_referers = @all_referers.uniq

		i = 0
		@all_referers.each do |referer|
			@referers << [referer,i]
			i += 1
		end

		#Override value until code refactoring to display a better graph
		@all_referers = [@events.last.referer]
	end
end
