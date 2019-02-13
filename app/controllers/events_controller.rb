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

	private

	def authenticate_user
		unless current_user
			flash[:danger] = "Merci de vous connecter"
			redirect_to new_session_path
		end
	end

end

