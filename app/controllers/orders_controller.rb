class OrdersController < ApplicationController
  def index
    @order = Order.find(:item_id)
  end
end
