class ReviewsController < ApplicationController

  def new
    user_logged_in?
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    @review = Review.new
    @review.motorcycle = @motorcycle
  end
# Crazy bike, makes no sense to ride on the streets. Pretty sweet track bike though.
  def create
    user_logged_in?
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    @review = Review.new(review_params)
    @review.motorcycle_id = @motorcycle.id
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "Review created!"
      redirect_to @motorcycle
    else
      @errors = @review.errors.full_messages
      render action: 'new'
    end
  end

  def edit

  end

  def update

  end

  private

  def review_params
    params.require(:review).permit(:title, :description)
  end

end
