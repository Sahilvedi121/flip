class AddressesController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.address
      redirect_to edit_address_path(current_user.address)
    else
      @address = Address.new
    end
  end

  def create
    @address = current_user.build_address(address_params)

    if @address.save
      redirect_to root_path, notice: 'Address added successfully.'
    else
      render :new
    end
  end

  def edit
    @address = current_user.address

    if @address.nil?
      redirect_to new_address_path, alert: "Address not found"
    end
  end

  def update
    @address = current_user.address

    if @address.update(address_params)
      redirect_to root_path, notice: 'Address updated successfully.'
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:colony, :city, :pincode, :country)
  end
end
