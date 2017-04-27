class MotorcyclesController < ApplicationController

  def index
    if params[:search] == nil
      @motorcycles = Motorcycle.all
    else
      @motorcycles = Motorcycle.where(make: params[:search]).or(
        Motorcycle.where(model: params[:search])).or(
        Motorcycle.where(cc: params[:search]))
    end
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
    @reviews = Review.where(motorcycle_id: @motorcycle.id)
    @vote = Vote.new
    if current_user
      @review = @reviews.where(user_id: current_user.id)[0]
    end
  end

  def new
    user_logged_in?
    @motorcycle = Motorcycle.new
    @style = Style.all.map { |s| s.style  }
  end

  def create
    user_logged_in?
    @motorcycle = Motorcycle.new(motorcycle_params)
    @motorcycle.style_id = Style.where(style: params[:motorcycle][:style])[0].id
    @motorcycle.user_id = current_user.id
    if @motorcycle.save
      flash[:notice] = "Motorcycle created!"
      redirect_to @motorcycle
    else
      @errors = @motorcycle.errors.full_messages
      @style = Style.all.map { |s| s.style  }
      render action: 'new'
    end
  end

  def edit
    @motorcycle = Motorcycle.find(params[:id])
    if correct_user?
      @style = Style.all.map { |s| s.style  }
    else
      flash[:notice] = "You are not authorized to view that page"
      redirect_to motorcycles_path
    end
  end

  def update
    @motorcycle = Motorcycle.find(params[:id])
    @motorcycle.style_id = Style.where(style: params[:motorcycle][:style])[0].id
    @motorcycle.user_id = current_user.id
    if @motorcycle.update(motorcycle_params)
      flash[:notice] = "Motorcycle Updated!"
      redirect_to @motorcycle
    else
      @errors = @motorcycle.errors.full_messages
      @style = Style.all.map { |s| s.style  }
      render action: 'edit'
    end
  end

  def destroy
    @motorcycle = Motorcycle.find(params[:id])
    if correct_user?
      @motorcycle.destroy
      flash[:notice] = "Motorcycle Deleted"
      redirect_to motorcycles_path
    else
      flash[:notice] = "You are not authorized"
      redirect_to @motorcycle
    end
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:make, :model, :cc)
  end

end
