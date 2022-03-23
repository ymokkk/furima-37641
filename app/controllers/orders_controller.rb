class OrdersController < ApplicationController

  def index
    @order_mailing = OrderMailing.new
  end

  def create
  end
end
