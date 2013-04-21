class ProposalsController < ApplicationController
  set_tab :proposals
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  # GET /proposals
  # GET /proposals.json
  def index
    # @proposals_this_week = Proposal.this_week
    # @proposals_next_week = Proposal.next_week
    redirect_to :controller => :venues, 
                :action => :show, 
                :id => params[:venue_id]
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @wait_list = @proposal.signups.select { |s| s.accommodation_id == nil }
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new

    begin
      @venue = Venue.find(params[:venue_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to venues_path, alert: 'You must select a valid venue first.'
    end
  end

  # GET /proposals/1/edit
  def edit
    @venue = @proposal.venue
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to [@proposal.venue, @proposal], notice: 'Proposal was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to [@proposal.venue, @proposal], notice: 'Proposal was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:venue_id, :relative_week, :comments)
    end
end
