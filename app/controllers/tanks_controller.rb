class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy]
  before_action :set_station

  # GET /tanks
  # GET /tanks.json
  def index
    @tanks = Tank.all
  end

  # GET /tanks/1
  # GET /tanks/1.json
  def show
  end

  # GET /tanks/new
  def new
   @task = Tank.new
  end

  # GET /tanks/1/edit
  def edit

  end

  # POST /tanks
  # POST /tanks.json
  def create
    @tank = Tank.new(tank_params)
    @tank.station = @station
    
    respond_to do |format|
      if @station.tank.save
        format.html { redirect_to @tank, notice: 'Tank was successfully created.' }
        format.json { render :show, status: :created, location: @tank }
      else
        format.html { render :new }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tanks/1
  # PATCH/PUT /tanks/1.json
  def update
    respond_to do |format|
      if @station.tank.update(tank_params)
        format.html { redirect_to @tank, notice: 'Tank was successfully updated.' }
        format.json { render :show, status: :ok, location: @tank }
      else
        format.html { render :edit }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
    @tank = @station.tanks.find(params[:id])
    @tank.destroy
    respond_to do |format|
      format.html { redirect_to @station, notice: 'Tank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

   def set_station
     @station = Station.find(params[:station_id])
   end

    def set_tank
      @tank = Tank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tank_params
      params.require(:tank).permit(:type_of_fuel, :size, :registration_id, :station_id)
    end
end
