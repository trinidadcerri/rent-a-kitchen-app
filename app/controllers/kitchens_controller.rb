class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show]

  def index
    @kitchens = Kitchen.all
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.user = current_user
    if @kitchen.save
      redirect_to @kitchen
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @marker = {
      lat: @kitchen.latitude,
      lng: @kitchen.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { kitchen: @kitchen }),
      marker_html: render_to_string(partial: "marker", locals: { kitchen: @kitchen })
    }
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_kitchen
    id = params[:id] ? params[:id] : params[:kitchen_id]
    @kitchen = Kitchen.find(id)
  end

  def kitchen_params
    params.require(:kitchen).permit(:name, :address, :description, :price, :capacity, :photo)
  end
end
