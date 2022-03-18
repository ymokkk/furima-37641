class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
     render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:item_name, :explanation, :category_id, :status_id, :delivery_id, :area_id, :shipping_day_id, :price, :user).merge(user_id: current_user.id)
  end

end
