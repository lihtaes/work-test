class AdminController < ApplicationController
  #before_action :admin?

  def home
    @representative = Representative.build
  end

  private 

    def admin?
    end

end