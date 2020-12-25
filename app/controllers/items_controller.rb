class ItemsController < ApplicationController
    def index
        
    end

    def new
        @item = Item.new
    end

    def create
        Item.create(item_params)
    end

    private
    def item_params
        params.require(:item).permit(:name, :infomation, :category_id, :status_id, :payer_id, :prefecture_id, :day_to_delivery_id, :price, :user_id)
    end
end
