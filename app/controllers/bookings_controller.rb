class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show]
  before_action :set_item, only: %i[new create]

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = @item.bookings.new
  end

  def create
    @booking = @item.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
