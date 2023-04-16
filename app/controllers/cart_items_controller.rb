# frozen_string_literal: true

class CartItemsController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    if cart_item
      cart_item.quantity = cart_item.quantity.to_i + params[:quantity].to_i
      cart_item.save!
    else
      current_cart.cart_items.build(item_id: params[:item_id], quantity: params[:quantity]).save!
    end
    redirect_to item_cart_items_path
  end

  def destroy
    my_cart_item = current_cart.cart_items.find(params[:id])
    my_cart_item.destroy
    redirect_to request.referer
  end
end
