class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # def gather_data(params, current_user)
  #   make = params[:motorcycle][:make]
  #   model = params[:motorcycle][:model]
  #   cc = params[:motorcycle][:cc]
  #   style = Style.where(style: params[:motorcycle][:style])[0].id
  #   new_moto = Motorcycle.new(make: make, model: model, cc: cc,
  #     style_id: style, user_id: current_user.id)
  #   new_moto
  # end

  helper_method :correct_user
  def correct_user
    if current_user.nil?
      return false
    else
      current_user == @motorcycle.creator
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:first_name, :last_name, :username])
  end
end
