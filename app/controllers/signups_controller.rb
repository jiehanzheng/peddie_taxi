class SignupsController < ApplicationController
  set_tab :signups
  before_action :set_signup, only: [:show, :edit, :update, :destroy]

  # GET /signups
  # GET /signups.json
  def index
    @signups = Signup.all
  end

  # GET /signups/1
  # GET /signups/1.json
  def show
  end

  # GET /signups/new
  def new
    @signup = Signup.new

    begin
      @accommodation = Accommodation.find(params[:accommodation_id])
      @proposal = @accommodation.proposal
    rescue ActiveRecord::RecordNotFound
      @proposal = Proposal.find(params[:proposal_id])
    end
  end

  # GET /signups/1/edit
  def edit
  end

  # POST /signups
  # POST /signups.json
  def create
    @signup = Signup.new(signup_params)
    @signup.user = current_user

    respond_to do |format|
      if @signup.save
        format.html { redirect_to [@signup.proposal.venue, @signup.proposal], 
                                  notice: 'You have signed up successfully.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /signups/1
  # PATCH/PUT /signups/1.json
  def update
    respond_to do |format|
      if @signup.update(signup_params)
        format.html { redirect_to [@signup.proposal.venue, @signup.proposal], 
                                  notice: 'Signup was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    @signup.destroy
    respond_to do |format|
      format.html { redirect_to [@signup.proposal.venue, @signup.proposal] }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      @signup = Signup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signup_params
      params.require(:signup).permit(:proposal_id, :accommodation_id)
    end
end
