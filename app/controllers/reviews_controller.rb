class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @kitchen = Kitchen.find(params[:kitchen_id])
    @review.kitchen = @kitchen
    @review.user = current_user
    if @review.save
      redirect_to @kitchen
    else
      render 'kitchens/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to kitchen_path(@review.kitchen)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :raiting)
  end
end
