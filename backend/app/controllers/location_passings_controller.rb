class LocationPassingsController < ApplicationController
  before_action :set_location_passing, only: [:show, :edit, :update, :destroy]

  # GET /location_passings
  # GET /location_passings.json
  def index
    @location_passings = LocationPassing.all
  end

  # GET /location_passings/1
  # GET /location_passings/1.json
  def show
  end

  # GET /location_passings/new
  def new
    @location_passing = LocationPassing.new
  end

  # GET /location_passings/1/edit
  def edit
  end

  # POST /location_passings
  # POST /location_passings.json
  def create
    @location_passing = LocationPassing.new(location_passing_params)

    respond_to do |format|
      if @location_passing.save
        format.html { redirect_to @location_passing, notice: 'Location passing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location_passing }
      else
        format.html { render action: 'new' }
        format.json { render json: @location_passing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_passings/1
  # PATCH/PUT /location_passings/1.json
  def update
    respond_to do |format|
      if @location_passing.update(location_passing_params)
        format.html { redirect_to @location_passing, notice: 'Location passing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location_passing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_passings/1
  # DELETE /location_passings/1.json
  def destroy
    @location_passing.destroy
    respond_to do |format|
      format.html { redirect_to location_passings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_passing
      @location_passing = LocationPassing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_passing_params
      params.require(:location_passing).permit(:enter_point, :entered_at, :exit_point, :exited_at, :user, :location)
    end
end
