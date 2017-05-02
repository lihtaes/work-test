class RepresentativesController < ApplicationController
  load_and_authorize_resource
  before_action :set_company!

  def index
    @representatives = @company.representatives
  end

  def new
    @representative = Representative.new
  end

  def create
    @representative = Representative.build(rep_params)
    @representative.update!(company_id: @company.id)

    if @representative.save
      flash[:notice] = "Successfully created Representative." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @representative = Representative.find(params[:id])
  end

  def update
    @representative = Representative.find(params[:id])
    params[:representative].delete(:password) if params[:representative][:password].blank?
    params[:representative].delete(:password_confirmation) if params[:representative][:password].blank? and params[:representative][:password_confirmation].blank?
    if @representative.update_attributes(params[:representative])
      flash[:notice] = "Successfully updated Representative."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @representative = Representative.find(params[:id])
    if @representative.destroy
      flash[:notice] = "Successfully deleted Representative."
      redirect_to root_path
    end
  end 

  private 
    def set_company!
      @company = current_representative.company
    end

    def rep_params
      params.require(:representative).permit(:email, :first_name, :last_name, :password, :password_confirmation, :type, company_attributes: [:name])
    end
end