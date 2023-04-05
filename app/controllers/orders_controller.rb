# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.current_cart.cart_items.build
    if Order.oeder_checkout(@order)
      redirect_to items_path, notice: '購入ありがとうございます'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:firstname, :lastname, :username, :email, :address1, :address2, :country_code, :state_code,
                                  :zip, :card_number, :card_name, :card_expiration, :card_cvv)
  end
end
