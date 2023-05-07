# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_cart_items, only: [:create]
  before_action :set_promotion_code, only: [:create]
  before_action :set_total_amount, only: [:create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      current_cart.cart_items.each { |cart_item| cart_item.update(order_id: @order.id) }
      OrderDetailMailer.with(order: @order, cart_items: @cart_items,
                             promotion_code: @promotion_code, total_amount: @total_amount).order_detail.deliver_now
      reset_session
      redirect_to items_path, success: '購入ありがとうございます'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_cart_items
    @cart_items = current_cart.cart_items
  end

  def set_promotion_code
    return unless current_cart.promotion_code

    @promotion_code = current_cart.promotion_code
  end

  def set_total_amount
    @total_amount = current_cart.total_amount
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :user_name, :email, :address1, :address2, :country, :state,
                                  :zip, :card_name, :card_number, :card_expiration, :card_cvv)
  end
end
