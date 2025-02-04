class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    cart_items = current_user.carts.includes(:product)
    
    if cart_items.empty?
      redirect_to carts_path, alert: "Your cart is empty!"
      return
    end

    total_price = cart_items.sum { |item| item.product.price * item.quantity }
    order = current_user.orders.create(total_price: total_price, status: "Pending")

    if order.persisted?
      cart_items.each do |cart_item|
        order.cart_items.create(product: cart_item.product, quantity: cart_item.quantity)
      end
      current_user.carts.destroy_all  # Empty cart after order
      redirect_to order_path(order), notice: "Order placed successfully!"
    else
      redirect_to carts_path, alert: "Order creation failed"
    end
  end
end
