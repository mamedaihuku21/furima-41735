class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update]
before_action :set_item, only: [:show, :edit, :update]
before_action :ensure_owner_for_edit, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_owner_for_edit
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :handing_time_id, :price, :image)
  end
end