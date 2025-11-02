class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ""
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      #次は決済処理が行われるか確認しようのところから
      @order_address.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
