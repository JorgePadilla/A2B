class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]

  # GET /costs
  # GET /costs.json
  def index
    @costs = Cost.all
  end

  # GET /costs/1
  # GET /costs/1.json
  def show
  end

  # GET /costs/new
  def new
    @cost = Cost.new
    @trip_id = params[:trip_id]


    @trip = Trip.find_by_id(@trip_id)
    @origin_s = @trip.origin
    @destiny_s = @trip.destiny
    
    @city_O = City.find_by_name(@origin_s)
    @origin_id = @city_O.id

    @city_d = City.find_by_name(@destiny_s)
    @destiny_id = @city_d.id


    #         = Trip.where("name = ?",)
    #@distance = Distance.first
    #@distance = Distance.where("origin_city_id = ?", 4)
     @distance = Distance.where("origin_city_id = ? AND destiny_city_id = ?", @origin_id, @destiny_id )
    #@object = 
     #@(km*k)/4
    # @price =
    @price = @distance.first.price
    
  end

  # GET /costs/1/edit
  def edit
  end

  # POST /costs
  # POST /costs.json
  def create
    @cost = Cost.new(cost_params)

    respond_to do |format|
      if @cost.save
        format.html { redirect_to @cost, notice: 'Cost was successfully created.' }
        format.json { render :show, status: :created, location: @cost }
      else
        format.html { render :new }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costs/1
  # PATCH/PUT /costs/1.json
  def update
    respond_to do |format|
      if @cost.update(cost_params)
        format.html { redirect_to @cost, notice: 'Cost was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost }
      else
        format.html { render :edit }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.json
  def destroy
    @cost.destroy
    respond_to do |format|
      format.html { redirect_to costs_url, notice: 'Cost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = Cost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cost_params
      params.require(:cost).permit(:seat, :cost, :trip_id)
    end
end
