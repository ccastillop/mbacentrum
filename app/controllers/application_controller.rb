class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    def after_sign_in_path_for(resource_or_scope)
      logger.info("ya estoy aqui luego de iniciar sesión")
      if current_user.profile == nil
        flash[:notice] = "Ahora debe crear su perfil"
        new_profile_path
      else
        super
      end
    end

    rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      redirect_to current_user.profile if current_user.profile
      redirect_to new_profile_path unless current_user.profile    
    end

end
