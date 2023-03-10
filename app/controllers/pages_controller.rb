class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @kitchens = Kitchen.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
