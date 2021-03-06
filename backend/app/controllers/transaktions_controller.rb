class TransaktionsController < ApplicationController
  before_action :set_transaktion, only: [:show, :edit, :update, :destroy]

  # GET /transaktions
  # GET /transaktions.json
  def index

    @transaktions = current_user.wallet.transaktions  #Transaktion.all
  end

  # GET /transaktions/1
  # GET /transaktions/1.json
  def show
  end

  # GET /transaktions/new
  def new
    @transaktion = Transaktion.new
  end

  # GET /transaktions/1/edit
  def edit
  end

  # POST /transaktions
  # POST /transaktions.json
  def create
    @transaktion = Transaktion.new(transaktion_params)

    respond_to do |format|
      if @transaktion.save
        format.html { redirect_to @transaktion, notice: 'Transaktion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaktion }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaktion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaktions/1
  # PATCH/PUT /transaktions/1.json
  def update
    respond_to do |format|
      if @transaktion.update(transaktion_params)
        format.html { redirect_to @transaktion, notice: 'Transaktion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaktion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaktions/1
  # DELETE /transaktions/1.json
  def destroy
    @transaktion.destroy
    respond_to do |format|
      format.html { redirect_to transaktions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaktion
      @transaktion = Transaktion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaktion_params
      params.require(:transaktion).permit(:wallet_id, :amount, :action)
    end
end
