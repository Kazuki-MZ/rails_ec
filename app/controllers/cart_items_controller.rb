# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy]

  def create
    add_item_to_cart
    redirect_to item_cart_items_path
  end

  def destroy
    @my_cart_item.destroy
    redirect_to item_cart_items_path
  end

  private

  def add_item_to_cart
    cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    if cart_item
      update_cart_item(cart_item)
    else
      create_new_cart_item
    end
  end

  def update_cart_item(cart_item)
    cart_item.quantity = cart_item.quantity.to_i + params[:quantity].to_i
    cart_item.save!
  end

  def create_new_cart_item
    current_cart.cart_items.build(item_id: params[:item_id], quantity: params[:quantity]).save!
  end

  def set_cart_item
    @my_cart_item = current_cart.cart_items.find(params[:id])
  end
end
