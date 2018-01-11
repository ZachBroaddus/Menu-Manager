class ItemsController < ApplicationController

  def index
    @items = Item.order(:category)
  end

  def new
  end

end
