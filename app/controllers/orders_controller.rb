class OrdersController < ApplicationController
  before_action :move_to_login, :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    @address = OrderAddress.new
  end

  def create
    @address = OrderAddress.new(order_params)
    if  @address.valid?
        pay_item
        @address.save
      return redirect_to root_path
    else
        render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_price: @item.item_price, item_id: @item.id)
  end

  def move_to_index
      @item = Item.find(params[:item_id])
    if  current_user.id == @item.user_id || @item.order != nil
        redirect_to root_path
    end
  end
  
  def move_to_login
    unless user_signed_in?
           redirect_to new_user_session_path
    end 
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:item_price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
