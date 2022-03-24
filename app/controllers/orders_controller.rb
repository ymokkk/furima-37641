class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_mailing = OrderMailing.new
  end

  def create
    @item = Item.find(params[:item_id])
   @order_mailing = OrderMailing.new(order_params)
   if @order_mailing.valid?
    @order_mailing.save
    redirect_to root_path
   else
    render :index
   end
  end

private

  def order_params
    params.require(:order_mailing).permit(:address_number, :area_id, :sichoson, :banchi, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end