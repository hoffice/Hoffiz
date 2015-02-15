class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:edit, :update, :destroy]

  def show
	  @event = Event.find_by_slug(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.event_date = Date.strptime(event_params[:event_date], "%m/%d/%Y")
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to dash_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /e/1
  # PATCH/PUT /e/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to dash_path, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def city
    @city = params[:city]
    @events = Event.where("city  = ? AND live = ?", params[:city], true).page params[:page]

    if @events.count == 0
      redirect_to root_path
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = current_user.events.find_by_slug(params[:id])
       rescue ActiveRecord::RecordNotFound
        flash[:notice] = "not authorized"
        redirect_to :action => 'index'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :event_date, :start_time, :end_time, :space_type, :near, :city, :coffee, :wifi, :header_img, :seats, :live )
    end
end
