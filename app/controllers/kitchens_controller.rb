class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @kitchens = Kitchen.search_by_name_and_address(params[:query])
    else
      @kitchens = Kitchen.all
    end
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
    if current_user == @kitchen.user
      if @kitchen.update(kitchen_params)
        redirect_to @kitchen, notice: 'Kitchen was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to kitchens_path, alert: 'You are not authorized to update this kitchen.'
    end
  end

  def destroy
    if current_user == @kitchen.user
      @kitchen.destroy
      redirect_to kitchens_path, notice: 'Kitchen was successfully destroyed.'
    else
      redirect_to kitchens_path, alert: 'You are not authorized to perform this action.'
    end
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
