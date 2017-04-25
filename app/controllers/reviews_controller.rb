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
    user_logged_in?
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    @review = Review.where(motorcycle_id: @motorcycle.id, user_id: current_user.id)[0]
  end

  def update
    user_logged_in?
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review Updated!"
      redirect_to @motorcycle
    else
      @errors = @review.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    user_logged_in?
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    @review = Review.where(motorcycle_id: @motorcycle.id, user_id: current_user.id)[0]
    @votes = Vote.where(review_id: @review.id)
    if correct_reviewer?
      @review.destroy
      @votes.length.times do
        @votes.last.delete
      end
      flash[:notice] = "Review Deleted"
      redirect_to @motorcycle
    else
      flash[:notice] = "You are not authorized"
      redirect_to @motorcycle
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description)
  end

end
