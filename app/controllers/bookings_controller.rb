class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  def createdate

    if valid_date?(params[:tofind])
      $datefind = Date.parse(params[:tofind])
    else
      $datefind = Date.today
    end

    case $datefind.wday #data de visualização sempre segunda
      when 0
        $datefind = $datefind + 1
      when 6
        $datefind = $datefind + 2
      when 2
        $datefind = $datefind - 1
      when 3
        $datefind = $datefind - 2
      when 4
        $datefind = $datefind - 3
      when 5
        $datefind = $datefind - 4
    end

    @user_in = current_user.id

    for dataagenda in $datefind..$datefind+4
      for horaagenda in 8..23
        agendado = Booking.find_by datareserva: dataagenda, horareserva: horaagenda
        if agendado.nil?
          #if horaagenda == 10
          #  idreserva = current_user.id
          #else
          #  idreserva = 1
          #end
          Booking.create(user_id: 1, datareserva: dataagenda, horareserva: horaagenda, descricao: '')
        end
      end
    end

    #Booking.delete_all
    redirect_back(fallback_location: root_path)
  end

  require 'date'
  def valid_date?(date)
    date_format = '%d/%m/%Y'
    DateTime.strptime(date, date_format)
    true
    rescue ArgumentError
    false
  end
  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
    Booking.create(user_id: 1, datareserva: @booking.datareserva, horareserva: @booking.horareserva, descricao: '')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:user_id, :datareserva, :horareserva, :descricao).merge(user: current_user)
    end
end
