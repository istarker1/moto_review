class MotorcyclesController < ApplicationController

  def index
    @motorcycles = Motorcycle.all
  end


end
