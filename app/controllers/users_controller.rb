class UsersController < ApplicationController
	before_action :authenticate_user!

	def dashboard	
	  @event = Event.new
	end
end
