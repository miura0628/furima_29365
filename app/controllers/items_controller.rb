class ItemsController < ApplicationController
 before_action :new_action, only: [:new]
 before_action :set_item, only: [:show, :update, :destroy]
 before_action :move_to_index, only: [:edit]

 def index 
    @items = Item.includes(:user).order("created_at DESC")
    @orders = Order.all
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
       redirect_to root_path
    else 
       render :edit
    end
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
       render :show
    end
  end
  
  def show
    @orders = Order.all
  end 

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end

  def new_action
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
