class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_mailing = OrderMailing.new
  end

  def create
  end
end

