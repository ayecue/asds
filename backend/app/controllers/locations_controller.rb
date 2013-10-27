class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = params[:user_id] ? LocationOwnership.all.where("'end' > ?", DateTime.now).where(:user=>current_user).collect(&:location) : Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  def passing

    @location = Location.find(params[:id])
    @location_ownership = @location.location_ownership
    if(!@location_ownership)
      render json: {status:'free',:object=>@location}
    elsif(@location_ownership.user == current_user)
      @location_ownership.prolonged++
      @location_ownership.end = DateTime.now + 24.hours
      @location_ownership.save!()
      render json: {status:'prolonged',:object=>@location_ownership}
    else
      @amount = 10
      @own_transaction = Transaktion.create!(:amount=> - @amount, :action=>Transaktion::ACTION_LOCATION_PASSING_PAY,:wallet=>current_user.wallet, :transaktionable=>@location)
      Transaktion.create!(:amount=> + @amount, :action=>Transaktion::ACTION_LOCATION_PASSING_RECEIVE,:wallet=>@location_ownership.user.wallet, :transaktionable=>@location)
      render json: {status:'charged',:object=>@own_transaction}
    end

  end

  def buy

    @location = Location.find(params[:id])
    if(@location.location_ownership)
      render json: {status:'sold',:object=>@location.location_ownership} , status: :unprocessable_entity
    else
      @location_ownership = LocationOwnership.create(:location=>@location,:start=>DateTime.now, :user=>current_user, :end=>DateTime.now + rand(50).hours)
      render json: @location_ownership
    end

  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :latlong)
    end
end
