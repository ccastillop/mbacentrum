class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :tiene_perfil?
  private

    def tiene_perfil?
      logger.info("revisando si tiene perfil")
      if current_user and current_user.profile == nil and !(params[:controller]=="profiles" and (params[:action]  =="new" or params[:action]  =="create"))
        flash[:notice] = "Ahora debe crear su perfil"
        redirect_to new_profile_path
      end
    end

    rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      redirect_to current_user.profile unless current_user.profile.blank?
      redirect_to new_profile_path if current_user.profile.blank?
    end

end
