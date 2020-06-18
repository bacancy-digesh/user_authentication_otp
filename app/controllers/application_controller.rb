class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller? 
	before_action :delete_otp_session, only: [:after_sign_out_path_for]


	def after_sign_in_path_for(resource_or_scope)
    return sent_opt_path
	end
	
	def after_sign_out_path_for(resource_or_scope)
		
		root_path
	end

	def delete_otp_session
		session[current_user.email] = nil
	end

	

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :contact_no,:country_code ) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :contact_no,:country_code  ) }
	end
end
