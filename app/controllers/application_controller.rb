class ApplicationController < ActionController::Base


	def after_sign_in_path_for(resource)
    	case resource
    	when Admin
     		admin_root_path(resource)
    	when Member
     		root_path(resource)
    	end
  	end


  	before_action :configure_permitted_parameters, if: :devise_controller?

  	protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:address,:postcode,:phone_number,:valid_status])
    #sign_upの際にデフォルト項目より追加したカラムのデータ操作を許可
	end

end
