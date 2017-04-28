class Api::V1::VotesController < ApplicationController

  def create
    # @motorcycle = Motorcycle.find(params[:motorcycle])
    @review = Review.find(params[:review_id])
    # set to button :commit
    @vote = Vote.new(vote: params[:commit], review_id: params[:review_id],
      user_id: params[:user_id])
    if !@review.already_voted?(current_user) && @vote.save
      flash[:notice] = "Vote Recorded!"
      data = {review: @review.id, vote: @vote, score: @review.score, type: "new"}
      render json: data, status: :created, location: api_v1_votes_path(@vote)
    end
  end

  def update
    @vote = Vote.where(review_id: params[:review_id], user_id: params[:user_id])[0]
    @review = Review.find(params[:review_id])
    @vote.vote = params[:commit]
    # binding.pry
    if @review.already_voted?(current_user) == params[:commit]
      delete
    elsif @review.already_voted?(current_user) != params[:commit] && @vote.save
      flash[:notice] = "Vote Updated!"
      data = {review: @review.id, vote: @vote, score: @review.score, type: "update"}
      render json: data, status: :created, location: api_v1_vote_path(@vote)
    elsif !@review.already_voted?(current_user) && @vote.save
      flash[:notice] = "Vote Recorded!"
      render json: :nothing, status: :created, location: @motorcycle
    else
      render json: :error
    end
  end

  def delete
    @vote.destroy
    flash[:notice] = "Vote Updated!"
    data = {review: @review.id, user: current_user.id, score: @review.score, type: "delete"}
    render json: data, status: :created, location: api_v1_vote_path(@vote)
  end

  private

  def vote_params
    params.require(:vote).permit(:review_id, :user_id)
  end

end
