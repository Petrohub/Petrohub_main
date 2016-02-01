class TanksController < ApplicationController
  #before_action :set_tank, only: [:show, :edit, :update, :destroy]
  #before_action :set_station

  #def set_station

  #end

  # GET /tanks
  # GET /tanks.json
  def index
    @station = Station.find(params[:station_id])
    @tanks = @station.tanks
  end

  # GET /tanks/1
  # GET /tanks/1.json
  def show
    @station = Station.find(params[:station_id])
    @tank = @station.tanks.find(params[:id])
  end

  # GET /tanks/new
  def new
   @station = Station.find(params[:station_id])
   @tank = @station.tanks.build
  end

  # GET /tanks/1/edit
  def edit
    @station = Station.find(params[:station_id])
    @tank = @station.tanks.find(params[:id])
  end

  # POST /tanks
  # POST /tanks.json
  def create
    @station = Station.find(params[:station_id])
    @tank = @station.tanks.create(tank_params)
    redirect_to station_path(@station)
  end

  # PATCH/PUT /tanks/1
  # PATCH/PUT /tanks/1.json
  def update
    @station = Station.find(params[:station_id])
    @tank = @station.tanks.find(params[:id])
    if @tank.update(tank_params)
      redirect_to station_tank_path(@station, @tank)
    else
      render "edit"
    end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
    @station = Station.find(params[:station_id])
    @tank = @station.tanks.find(params[:id])
    @tank.destroy
    respond_to do |format|
      format.html { redirect_to station_tanks_path(@station), notice: 'Tank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.



    #def set_tank
      #@tank = @station.tanks.find(params[:id])
  #  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tank_params
      params.require(:tank).permit(:type_of_fuel, :size, :registration_id, :station_id)
    end
end
