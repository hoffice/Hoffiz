class MessagesController < ApplicationController
  before_action :authenticate_user!
 
  def new
  end
 
  def create

  	recipient_id = Event.find(message_params[:event_id]).user

  	if recipient_id
    	recipient = User.find(recipient_id)
    	current_user.send_message(recipient, message_params[:body], message_params[:subject]).conversation
    	flash[:success] = "Message has been sent!"
    	redirect_to event_path(message_params[:slug])
  	else
  		flash[:alert] = "Something went wrong. Message was not sent!"
  		redirect_to event_path(message_params[:slug])
  	end

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body, :subject, :event_id, :slug)
    end
end