class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update, :destroy]
  before_action :redirect_unless_logged_in_admin, except: [:index]

  def index
    @entrees = Item.where(category: "entree")
    @appetizers = Item.where(category: "appetizer")
    @desserts = Item.where(category: "dessert")
    @beverages = Item.where(category: "beverage")

    @order_item = OrderItem.new
    @order = Order.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      flash.now[:error] = @item.errors.full_messages
      render :new
    end
  end

  def edit
    # @item = Item.new
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      flash.now[:error] = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price, :image)
  end

  def find_item
    @item = Item.find_by(id: params[:id])
  end

end
