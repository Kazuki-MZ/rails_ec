# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_cart_items, only: [:create]
  def create
    @order = Order.new(order_params)
    if @order.save
      current_cart.cart_items.each { |cart_item| cart_item.update(order_id: @order.id) }
      OrderDetailMailer.with(order: @order, cart_items: @cart_items).order_detail.deliver_now
      delete_cart_info
      redirect_to items_path, success: '購入ありがとうございます'
    else
      render template: 'cart_items/index', status: :unprocessable_entity
    end
  end

  private

  def delete_cart_info
    current_cart.destroy
    reset_session
  end

  def set_cart_items
    @cart_items = current_cart.cart_items
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :user_name, :email, :address1, :address2, :country, :state,
                                  :zip, :card_name, :card_number, :card_expiration, :card_cvv)
  end
end
