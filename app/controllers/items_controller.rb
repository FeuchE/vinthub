class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    if params[:query].present?
      @items = Item.search_by_title_and_description_and_category_and_brand_and_size(params[:query])
    else
      @items = Item.all
    end
  end

  def show
    authorize @item
    @booking = Booking.new
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item

    if @item.save
      redirect_to item_path(@item), notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @item
  end

  def update
    @item.user = current_user
    authorize @item
    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.user = current_user
    authorize @item
    @item.destroy
    redirect_to items_path, notice: 'Item was successfully removed.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo, :category, :size, :brand)
  end
end
