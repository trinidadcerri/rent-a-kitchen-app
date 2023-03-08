class KitchensController < ApplicationController

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
  private

  def kitchen_params
    params.require(:kitchen).permit(:name, :address, :description, :price, :capacity, :photo_url)
  end
end
