class RequestsController < ApplicationController
  set_tab :requests

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    if not fetch_venue_info
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])

    if not fetch_venue_info @request.venue_id
      return
    end
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request])

    @request.departure_time_slots = organize_departure_time_slots(@request.departure_time_slots)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        if not fetch_venue_info params[:request][:venue_id]
          return
        end
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    params[:request][:departure_time_slots] = organize_departure_time_slots(params[:request][:departure_time_slots])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        if not fetch_venue_info params[:request][:venue_id]
          return
        end
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end


  private

  def organize_departure_time_slots(messed_up_departure_time_slots)
    #
    # TODO: form submission is dirty.  Is there a better way to do it?
    #
    
    # --- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
    # departure_time_slots: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
    #   date:
    #   - 12/01/2012
    #   - 12/02/2012
    #   time: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
    #     start:
    #     - '12:12'
    #     - '12:12'
    #     end:
    #     - '12:13'
    #     - '12:13'
    # stay_duration: '5'
    # note: ''

    # time to clean it up
    organized_departure_time_slots = Array.new

    # since # of [time][start|end] is the same as that of [date], we can simply
    # iterate thru date and use the same index variable
    messed_up_departure_time_slots[:date].each_with_index do |date, index|
      organized_departure_time_slots[index] = Hash.new

      organized_departure_time_slots[index][:date] = date
      organized_departure_time_slots[index][:start_time] = 
                            messed_up_departure_time_slots[:time][:start][index]
      organized_departure_time_slots[index][:end_time] = 
                              messed_up_departure_time_slots[:time][:end][index]

    end

    # override and reuse the submitted departure_time_slots variable
    departure_time_slots = Array.new

    # for each, convert to Time and store it in the db.  While we do this,
    # we have to think about validation because validation for this is disabled 
    # in the model
    begin
      organized_departure_time_slots.each_with_index do |str_data, index|
        departure_time_slots[index] = Hash.new

        start_string = "#{str_data[:date]} #{str_data[:start_time]} #{Time.zone.name}"
        end_string = "#{str_data[:date]} #{str_data[:end_time]} #{Time.zone.name}"
        userinput_format = "%m/%d/%Y %H:%M"
        
        departure_time_slots[index][:start] = DateTime.strptime( start_string,
                                                                 userinput_format )
        departure_time_slots[index][:end] = DateTime.strptime( end_string,
                                                               userinput_format )
      end
    rescue
      departure_time_slots = ""
    end

    # sort slots by starting times
    if 0 != departure_time_slots.length
      departure_time_slots.sort_by { |time_slot| time_slot[:start] }
    end
  end

  def fetch_venue_info(venue_id=nil)
    venue_id ||= params[:venue_id]

    # if no venue is selected, redirect user back to venues#index
    if venue_id.blank?
      redirect_to venues_path, :alert => "You have to select a venue first."
      return false
    end

    # get venue information
    @venue = Venue.find(venue_id)
  end
end
