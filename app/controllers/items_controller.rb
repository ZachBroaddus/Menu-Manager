class ItemsController < ApplicationController

  def index
    @items = Item.order(:category)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      @errors = @item.errors.full_messages
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price)
  end

end
