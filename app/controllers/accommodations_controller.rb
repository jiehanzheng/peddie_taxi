class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]

  # GET /accommodations
  # GET /accommodations.json
  def index
    redirect_to :controller => :proposals, 
                :action => :show, 
                :id => params[:proposal_id]
  end

  # GET /accommodations/1
  # GET /accommodations/1.json
  def show
  end

  # GET /accommodations/new
  def new
    @accommodation = Accommodation.new

    begin
      @proposal = Proposal.find(params[:proposal_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to proposals_path, alert: 'You must select a valid proposal first.'
    end
  end  

  # GET /accommodations/1/edit
  def edit
    @proposal = @accommodation.proposal
  end

  # POST /accommodations
  # POST /accommodations.json
  def create
    @accommodation = Accommodation.new(accommodation_params)

    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to @accommodation.proposal, notice: 'Accommodation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @accommodation }
      else
        format.html { render action: 'new' }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accommodations/1
  # PATCH/PUT /accommodations/1.json
  def update
    respond_to do |format|
      if @accommodation.update(accommodation_params)
        format.html { redirect_to @accommodation.proposal, notice: 'Accommodation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
    @accommodation.destroy
    respond_to do |format|
      format.html { redirect_to accommodations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accommodation_params
      params.require(:accommodation).permit(:proposal_id, 
                                            :day_of_week, 
                                            :leaving_at, 
                                            :returning_at, 
                                            :comments)
    end
end
