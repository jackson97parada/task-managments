class EnterprisesController < ApplicationController
  # GET all
  def index
    @enterprises = Enterprise.all
    render json: @enterprises
  end

  #GET filter by id
  def show
    enterprise
    render json: enterprise
  end

  #POST create register
  def create
    @enterprise = Enterprise.new(enterprise_params)
    if @enterprise.save
      render json: @enterprise
    end
  end

  #PATCH update register
  def update    
    if enterprise.update(enterprise_params)
      render json: enterprise
    end  
  end

  #PUT updated status
  def update_enabled
    enterprise.update(enable: !enterprise.enable)
  end

  #DELETE delete register
  def destroy
    enterprise.destroy
  end

  private

  #function private
  def enterprise_params
    params.require(:enterprise).permit(:nit, :address, :mobile)
  end

  #function private
  def enterprise
    Enterprise.find(params[:id])
  end
end
