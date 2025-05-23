class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show destroy]
  before_action :set_item, only: %i[new create]
  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    @bookings = current_user.bookings
  end

  def show
    authorize @booking
  end

  def new
    @booking = @item.bookings.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user = current_user
    authorize @booking

    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, notice: 'You booking was successfully removed.'
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
