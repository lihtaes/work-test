 class RegistrationsController < Devise::RegistrationsController
  # Because of Rails strong parameter we need to use the Registration controller Override
  # to sanitize inputs
  # Devise automatically knows wich one to use
  private
    def sign_up_params
      params.require(:representative).permit( :email, :password, :password_confirmation, :type, company_attributes:[:name])
    end

    def account_update_params
      # For updates we make sure to let the Company ID pass through or the form will
      # generate a new company every time we edit our details
      params.require(:representative).permit(:email, :password, :password_confirmation, :current_password, :type, company_attributes: [:id, :name])
    end
end