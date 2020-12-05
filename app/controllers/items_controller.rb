class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = items.new(item_params)
    @item.save
  end

private

def item_params
  params.require(:item).permit(:image).merge(user_id: current_user.id)
end

end
