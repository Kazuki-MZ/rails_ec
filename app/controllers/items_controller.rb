# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @other_items = Item.where.not(id: @item).order('RANDOM()')
  end
end
