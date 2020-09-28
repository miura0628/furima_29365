class OrdersController < ApplicationController
  before_action :move_to_login, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    #@item = Item.find(params[:item_id])
    #@order = @item.order.new(order_params)
    #@order.save
  end

  private

  def order_params
    #params.require(:order).permit(:item_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end 
  end

end
