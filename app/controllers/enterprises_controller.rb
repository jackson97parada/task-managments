class EnterprisesController < ApplicationController
  # GET all
  def index
    @enterprises = Enterprise.paginate(page: params[:page], per_page: 30)
    render json: @enterprises
  end

  #GET filter by id
  def show
    render json: enterprise
  end

  #POST create register
  def create
    @enterprise = Enterprise.new(enterprise_params)
    if @enterprise.save
      render json: @enterprise, status: :created 
    else
      render json: @enterprise.errors, status: :unprocessable_entity #422
    end
  end

  #PUT update register
  def update    
    if enterprise.update(enterprise_params)
      render json: enterprise
    else
      render json: enterprise.errors, status: :unprocessable_entity
    end  
  end

  #PUT updated status
  def update_enabled
    if enterprise.update(enable: !enterprise.enable)
      render json: enterprise
    end
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
