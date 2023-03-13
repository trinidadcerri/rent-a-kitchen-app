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
    if @kitchen.save
      redirect_to kitchens_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
    @marker = {
      lat: @kitchen.latitude,
      lng: @kitchen.longitude
    }
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
