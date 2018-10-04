class RegisterController <  Devise::RegistrationsController


before_action :get_secret_codes, only:[:create,:new]

private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,:secret_code_id)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

  def get_secret_codes
  	@secret_codes = SecretCode.where(is_used:false)
  end

  
end
