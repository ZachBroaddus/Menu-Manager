class ItemsController < ApplicationController

  def index
    @items = Item.order(:category)
  end

end
