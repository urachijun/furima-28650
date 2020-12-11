class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :descriptionm, :category_id, :state_id, :shipping_fee_burden_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
