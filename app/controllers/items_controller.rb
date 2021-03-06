class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user == @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :delivery_id, :area_id,
                                 :shipping_day_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
    redirect_to root_path if @item.user_id != current_user.id || !@item.order.nil?
  end
end
