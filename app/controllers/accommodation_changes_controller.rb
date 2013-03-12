class AccommodationChangesController < ApplicationController
  # GET /accommodation_changes
  # GET /accommodation_changes.json
  def index
    @accommodation_changes = AccommodationChange.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accommodation_changes }
    end
  end

  # GET /accommodation_changes/1
  # GET /accommodation_changes/1.json
  def show
    @accommodation_change = AccommodationChange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accommodation_change }
    end
  end

  # GET /accommodation_changes/new
  # GET /accommodation_changes/new.json
  def new
    @accommodation_change = AccommodationChange.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accommodation_change }
    end
  end

  # GET /accommodation_changes/1/edit
  def edit
    @accommodation_change = AccommodationChange.find(params[:id])
  end

  # POST /accommodation_changes
  # POST /accommodation_changes.json
  def create
    @accommodation_change = AccommodationChange.new(params[:accommodation_change])

    respond_to do |format|
      if @accommodation_change.save
        format.html { redirect_to @accommodation_change, notice: 'Accommodation change was successfully created.' }
        format.json { render json: @accommodation_change, status: :created, location: @accommodation_change }
      else
        format.html { render action: "new" }
        format.json { render json: @accommodation_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accommodation_changes/1
  # PUT /accommodation_changes/1.json
  def update
    @accommodation_change = AccommodationChange.find(params[:id])

    respond_to do |format|
      if @accommodation_change.update_attributes(params[:accommodation_change])
        format.html { redirect_to @accommodation_change, notice: 'Accommodation change was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accommodation_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodation_changes/1
  # DELETE /accommodation_changes/1.json
  def destroy
    @accommodation_change = AccommodationChange.find(params[:id])
    @accommodation_change.destroy

    respond_to do |format|
      format.html { redirect_to accommodation_changes_url }
      format.json { head :no_content }
    end
  end
end
