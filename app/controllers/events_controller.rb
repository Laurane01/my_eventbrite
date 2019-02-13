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
    post_params = params[:event]
    if @event.update(title: post_params[:title], description: post_params[:description], price: post_params[:price].to_i, location: post_params[:location], start_date: post_params[:start_date], duration: post_params[:duration])
      redirect_to event_path(params[:id])
    else
      flash[:danger] = "Il manque des informations"
      render :new 
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    flash[:notice] = "Vous avez supprimé un potin avec succès"
    redirect_to root_path
  end

	private

	def authenticate_user
		unless current_user
			flash[:danger] = "Merci de vous connecter"
			redirect_to new_session_path
		end
	end

end

