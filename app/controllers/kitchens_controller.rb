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
  end

  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
    params.require(:kitchen).permit(:name, :address, :description, :price, :capacity, :photo)
  end
end
