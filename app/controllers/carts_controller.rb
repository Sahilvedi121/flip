class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_user.carts.includes(:product)
  end

  def create
    cart_item = current_user.carts.find_or_initialize_by(product_id: params[:product_id])
    cart_item.quantity = params[:quantity]

    if cart_item.save
      redirect_to carts_path, notice: "Item added to cart"
    else
      redirect_to products_path, alert: "Failed to add item"
    end
  end

  def destroy
    cart_item = current_user.carts.find(params[:id])
    cart_item.destroy
    redirect_to carts_path, notice: "Item removed from cart"
  end
end
