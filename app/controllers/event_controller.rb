class EventController < ApplicationController

	def index
		@all_events = Event.all

		@all_events_by_cities = @all_events.select(:location)

		puts @all_events_by_cities
		puts "uuuuuuuuuuuuuuuuuuu" * 50

			 @events_locations = params[:location]
puts @cities
puts "tttttttttttt" * 50
	end 


	def show
		@city = Event.all.find(params[:location])


		@array_of_events = []
		@array_of_events.each do
			@array_of_events << Event.find(params[:location])
		end
	end 
	puts @array_of_events

	puts "@" * 50
	puts @city
	puts "pppppppp" * 50


end 
#end 

		#def show

    #@city = params[:location].all.find(params[:id].to_i)
    #@array_of_events = []
    #events_ids = Event.where(city_id:params[:id]).ids
    ## print user_ids

    #$events_ids = []
    #user_ids.each do |id|
    #  $events_ids << Event.where(user_id:id).ids
    #end
    # print $gossips_ids
   # $events_ids = $events_ids.flatten

   # $events_ids.each do |event_id|
   #   @array_of_events << Event.find(event_id)
   # end
   # @array_of_events
 # end