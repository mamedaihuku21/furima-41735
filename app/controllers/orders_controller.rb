class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_root, only: [:index, :create]


  def index
    @order = Order.new
  end

  def create
    @order = Order.new(user_id: current_user.id, item_id: @item.id)
    if @order.save
      redirect_to root_path, notice: "購入が完了しました。"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

end
