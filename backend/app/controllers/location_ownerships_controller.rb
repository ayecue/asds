class LocationOwnershipsController < ApplicationController
  before_action :set_location_ownership, only: [:show, :edit, :update, :destroy]

  # GET /location_ownerships
  # GET /location_ownerships.json
  def index
    @location_ownerships = LocationOwnership.all
  end

  # GET /location_ownerships/1
  # GET /location_ownerships/1.json
  def show
  end

  # GET /location_ownerships/new
  def new
    @location_ownership = LocationOwnership.new
  end

  # GET /location_ownerships/1/edit
  def edit
  end

  # POST /location_ownerships
  # POST /location_ownerships.json
  def create
    @location_ownership = LocationOwnership.new(location_ownership_params)

    respond_to do |format|
      if @location_ownership.save
        format.html { redirect_to @location_ownership, notice: 'Location ownership was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location_ownership }
      else
        format.html { render action: 'new' }
        format.json { render json: @location_ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_ownerships/1
  # PATCH/PUT /location_ownerships/1.json
  def update
    respond_to do |format|
      if @location_ownership.update(location_ownership_params)
        format.html { redirect_to @location_ownership, notice: 'Location ownership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location_ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_ownerships/1
  # DELETE /location_ownerships/1.json
  def destroy
    @location_ownership.destroy
    respond_to do |format|
      format.html { redirect_to location_ownerships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_ownership
      @location_ownership = LocationOwnership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_ownership_params
      params.require(:location_ownership).permit(:location_id, :user_id, :start, :end, :prolonged)
    end
end
