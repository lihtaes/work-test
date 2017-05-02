class ApplicationController < ActionController::Base
  include DeviseWhitelist
  
  alias_method :current_user, :current_representative
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  protect_from_forgery with: :exception

end