# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show; end

  def create
    @item = Item.new(item_params)
    @item.save!
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image_name, :stock)
  end
end
