class DeliveryDetailsController < ApplicationController
  before_action :authenticate_user!
 

  def index
    @delivery_details = current_user.delivery_details
  end

  def new
    @delivery_details = DeliveryDetails.new
  end

  def show
  end

  def create
    @delivery_details = current_user.delivery_details.build(delivery_detail_params)
    if @delivery_detail.save
      redirect_to delivery_details_path, notice:  "Delivery Details created successfully"
    else
      render :new
    end
  end

  private

  def delivery_details_prams
    params.reqiure(:delivery_details).permit(:address, :delivery_date, :other_parmas)
  end 
end
