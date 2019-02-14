class EventsController < ApplicationController

	before_action :authenticate_user, only: [:new]
	def index
		@events = Event.all

	end 


	def show
		@event= Event.all.find(params[:id].to_i)
		puts '@' * 30
		puts params
		puts '@' * 30

	end 

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(title: params[:title], description: params[:description], price: params[:price].to_i, location: params[:location], admin: current_user, start_date: params[:start_date], duration: params[:duration])

		if @event.save
			redirect_to root_path
		else
			flash[:danger] = "Il manque des informations"
			render :new 
		end
	end

	def edit
		@event = Event.find(params[:id])
	end 
	def update
		@event = Event.find(params[:id])
		event_params = Hash.new {   }
		event_params = params.require(:event).permit(:title, :description)

		@event.update(event_params)
		if @event.update(event_params)
			"Bravo tu as cree un new Event"
			redirect_to root_path
		else
			render :edit
		end 
	end

	private

	def authenticate_user
		unless current_user
			flash[:danger] = "Merci de vous connecter"
			redirect_to login_path
		end
	end

end