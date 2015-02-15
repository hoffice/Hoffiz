class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:destroy]

  # POST /boookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id

    conversation = current_user.send_message(recipients, booking_params[:message][:body], booking_params[:message][:subject]).conversation

    respond_to do |format|
      if @booking.save
        format.html { redirect_to dash_path, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to dash_path notice: 'Request was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = current_user.bookings.find(params[:id])
       rescue ActiveRecord::RecordNotFound
        flash[:notice] = "not authorized"
        redirect_to :action => 'index'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params[:booking].permit(:event_id, :message)
    end
end
