class ItemsController < ApplicationController
  def index
    if params[:query].present?
      @items = Item.search_by_title_and_description_and_category_and_brand_and_size(params[:query])
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to item_path(@item), notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo, :category, :size, :brand)
  end
end
