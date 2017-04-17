class MotorcyclesController < ApplicationController

  def index
    @motorcycles = Motorcycle.all
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end

  def new
    if current_user
      @motorcycle = Motorcycle.new
      @style = Style.all.map { |s| s.style  }
    else
      flash[:notice] = "You are not authorized to view this page"
      redirect_to motorcycles_path
    end
  end

  def create
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
    if current_user != @motorcycle.creator
      flash[:notice] = "You are not authorized to view that page"
      redirect_to motorcycles_path
    else
      @style = Style.all.map { |s| s.style  }
    end
  end

  def update
    @motorcycle = Motorcycle.find(params[:id])
    @motorcycle.style_id = Style.where(style: params[:motorcycle][:style])[0].id
    @motorcycle.user_id = current_user.id
    if @motorcycle.update(motorcycle_params)
      flash[:notice] = "Motorcycle updated!"
      redirect_to @motorcycle
    else
      @errors = @motorcycle.errors.full_messages
      @style = Style.all.map { |s| s.style  }
      render action: 'new'
    end
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:make, :model, :cc)
  end


end
