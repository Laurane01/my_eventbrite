class AttendancesController < ApplicationController

	before_action :authenticate_admin, only: [:index]
	#before_action :already_attendance_or_admin

	def index
		@event = Event.find(params[:event_id])
		@all_attendances = @event.attendances
	end

	def new
		@event = Event.find(params[:event_id])
		@attendance = Attendance.new
	end

	def subscribe
		@event = Event.find(params[:id])
		if @event.attendances.include? current_user
			flash[:error] = "Vous participez deja a l event"
			redirect_to @event
		end

		  # Amount in cents # permet de renvoyer sur le paiement pour la participation
		  @amount = @event.price*100

		  customer = Stripe::Customer.create(
		  	:email => params[:stripeEmail],
		  	:source  => params[:stripeToken]
		  	)

		  charge = Stripe::Charge.create(
		  	:customer    => customer.id,
		  	:amount      => @amount,
		  	:description => 'Rails Stripe customer',
		  	:currency    => 'usd'
		  	)

		  	 @attendance = Attendance.new(stripe_customer_id: charge[:customer], user: current_user, event: @event)
		  	 if @attendance.save
		  	  redirect_to @event
		  	  return
		  	    else
		  	    	flash[:danger] = "Les infos sont incomplets"
		  	    	 render :new 
		  	    	end
		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to @event
		end 

	def edit
	end

	def show
	end

	private

	def authenticate_admin
		@event = Event.find(params[:event_id])
		unless current_user == @event.admin
			flash[:danger] = "Cette section est reservee aux administrateurs des events"
			redirect_to event_path(params[:event_id])
		end
	end
end