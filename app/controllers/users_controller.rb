class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :get_mailbox

	def dashboard	
	  @event = Event.new
	  @conversations = @mailbox.inbox.take(4)
	end

	private
 
  	def get_mailbox
      @mailbox ||= current_user.mailbox
  	end
end
