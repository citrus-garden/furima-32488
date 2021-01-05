class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @items = Item.all.order("created_at DESC")
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to item_path(id: @item.id)
        else
            render :new
        end
    end

    def show
        @item = Item.find(params[:id])
    end

    private
    def item_params
        params.require(:item).permit(:name, :infomation, :category_id, :status_id, :payer_id, :prefecture_id, :day_to_delivery_id, :price, :user_id, :image).merge(user_id: current_user.id)
    end
end
