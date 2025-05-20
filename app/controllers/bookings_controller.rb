class BookingsController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_item, only: %i[new create]

  def index
    @bookings = @item.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = @item

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
