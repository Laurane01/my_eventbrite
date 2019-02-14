class UsersController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user= User.all.find(params[:id].to_i)
		puts '@' * 30
		puts params
		puts '@' * 30
	end 

end
