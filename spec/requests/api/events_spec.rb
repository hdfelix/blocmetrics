require 'spec_helper'

describe 'Events API' do

	describe "#index" do

		let(:url) {"/api/v1/events"}
		
		it "shows all the events" do
			5.times do 
				FactoryGirl.create(:event)
			end
		  get "#{url}.json" 
			events = JSON.parse(response.body)
			expect(events.size).to eq 5
		end
	end

	describe "#create" do

		let(:url) { "/api/v1/events" }

		it "creates an event" do
			event = FactoryGirl.build(:event)
			expect {
				post "#{url}.json", event: event.to_json
			}.to change(Event, :count).by(1)
		end
	end

	#it 'creates events' do
	#	FactoryGirl.create(:event)

	#	expect {
	#		post api_v1_events_path, events: {referer: 'blocitoff.com', name: 'Test', property_1: 'p1', property_2: 'p2' }
	#	}.to change(Event, :count).by(1)

	#	expect(response).to be_success				# Test for the 200 status-code
	#	#json = JSON.parse(response.body)
	#	#expect(json['events'].length.to eq(2)	# check right amount of events returned
	#end
end
