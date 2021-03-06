class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    #@trips = Trip.all
   # @user_name = @trip.user.name
   if :start_date.nil? && :origin.present? && :destiny.present?
    @trips = Trip.where(start_date: params[:start_date]).where('origin LIKE ?', "%#{params[:origin]}%").where('destiny LIKE ?', "%#{params[:destiny]}%")
    #@trips = Trip.where('origin LIKE ?', "%#{params[:origin]}%").where('destiny LIKE ?', "%#{params[:destiny]}%")
   elsif :origin.present? && :destiny.blank?
   # @trips = Trip.where('origin LIKE ?', "%#{params[:origin]}%").where('destiny LIKE ?', "%#{params[:destiny]}%")
  #    if :start_date.blank?
      @trips = Trip.where('origin LIKE ?', "%#{params[:origin]}%")
   elsif :origin.present? && :destiny.present?
       @trips = Trip.where('origin LIKE ?', "%#{params[:origin]}%").where('destiny LIKE ?', "%#{params[:destiny]}%")
     #    if :start_date.blank?
        # @trips = Trip.where('origin LIKE ?', "%#{params[:origin]}%")
   elsif :destiny.present? 
    @trips = Trip.where('destiny LIKE ?', "%#{params[:destiny]}%")
  #    else
  #     @trips = @trips.where('origin LIKE ?', "%#{params[:origin]}%")
  #    end
   # elsif :destiny.present?
    # @trips = Trip.where('destiny LIKE ?', "%#{params[:destiny]}%")
    #elsif :origin.present?
     # @trips = Trip.where('origin LIKE ?', "%#{params[:origin]}%")
    else
     @trips = Trip.all
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  def confirm

    respond_to do |format|
      if @trip.save
        #format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.html { redirect_to :controller=>"costs", :action=> "new", :trip_id=>@trip.id}
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id

    if @trip.roundtrip
      @trip2 = Trip.new()
      @trip2.start_date = @trip.end_date
      @trip2.start_time = @trip2.end_time

      @trip2.origin = @trip.destiny
      @trip2.destiny = @trip2.origin

      @trip2.passcities = @trip.passcities

      @trip2.save
    else
    end
    
    respond_to do |format|
      if @trip.save
        #format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.html { redirect_to :controller=>"costs", :action=> "new", :trip_id=>@trip.id}
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:user_id, :origin, :destiny, :start_date, :start_time, :end_date, :end_time, :confirm, :roundtrip)
    end
end
