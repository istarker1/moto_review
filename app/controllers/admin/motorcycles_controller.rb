class Admin::MotorcyclesController < ApplicationController

  def index
    admin?
    @motorcycles = Motorcycle.all
  end

  def show
    admin?
    @motorcycle = Motorcycle.find(params[:id])
    @reviews = Review.where(motorcycle_id: @motorcycle.id)
    if current_user
      @review = @reviews.where(user_id: current_user.id)[0]
    end
  end

  def destroy
    admin?
    @motorcycle = Motorcycle.find(params[:id])
    @motorcycle.destroy
    flash[:notice] = "Motorcycle Deleted"
    redirect_to admin_motorcycles_path
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
