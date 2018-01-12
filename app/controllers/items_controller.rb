class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update, :destroy]
  before_action -> { redirect_unless_logged_in_admin }, except: [:index]

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

  def edit
  end

  def update
    if @item.update(params[:item].permit(:name, :description, :category, :price))
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price)
  end

  def find_item
    @item = Item.find_by(id: params[:id])
  end

end
