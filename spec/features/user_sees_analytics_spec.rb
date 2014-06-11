require 'spec_helper'

feature 'user visits /applications' do
	scenario 'successfully' do
		visit root_path
		event = FactoryGirl.create(:event)
		#heading = "Event Data for Application: #{event.referer}"
		heading = "Event Data for Application: Blocipedia"
		expect(page).to have_content(heading)
	end
end
