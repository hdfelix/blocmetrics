require 'faker'

print 'Generating test Events: '
90.times do 
	event = Event.new
	referers = ['locahost.com', 'mysite.com', 'testing.org']
  names = [ 'first', 'second', 'third', 'fourth' ]
	referer = referers[rand(0..3)]
	name = names[rand(1..4)]
	property_1 = rand(1..5).to_s
	property_2 = rand(5..25).to_s

	event.update_attributes(referer: referer, name: name, property_1: property_1, property_2: property_2)
	event.save
	print '.'
end
puts ' '
