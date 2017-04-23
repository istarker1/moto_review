class Api::V1::VotesController < ApplicationController

  def create
    @motorcycle = Motorcycle.find(params[:motorcycle])
    @review = Review.find(params[:review_id])
    @vote = Vote.new(vote: params[:vote], review_id: params[:review_id],
      user_id: params[:user_id])
      binding.pry
    if !@review.already_voted?(current_user) && @vote.save
      flash[:notice] = "Vote Recorded!"
      render json: :nothing, status: :created, location: @motorcycle
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:review_id, :user_id)
  end

end
