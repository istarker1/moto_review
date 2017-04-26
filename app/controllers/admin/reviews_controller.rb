class Admin::ReviewsController < ApplicationController

  def destroy
    admin?

    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    @review = Review.find(params[:id])
    @votes = Vote.where(review_id: @review.id)
    @review.destroy
    @votes.length.times do
      @votes.last.delete
    end
    flash[:notice] = "Review Deleted"
    redirect_to admin_motorcycle_path(@motorcycle)
  end

  private

  def admin?
    if current_user
      if current_user.role != "admin"
        flash[:notice] = "You are not authorized"
        redirect_to motorcycles_path
      end
    else
      flash[:notice] = "You are not authorized"
      redirect_to motorcycles_path
    end
  end

end
