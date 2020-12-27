class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
      if @purchase_address.valid?
        @purchase_address.save
        redirect_to items_path
      else
        render action: :index
      end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id:current_user.id, item_id:params[:item_id] )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
