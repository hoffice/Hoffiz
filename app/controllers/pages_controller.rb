class PagesController < ApplicationController

	def home
		@user = User.new
		@events = Event.where({:featured => true});
	end

	def faq
	end
	
end
