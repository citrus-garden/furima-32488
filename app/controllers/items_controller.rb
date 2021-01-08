class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    before_action :item_find, only: [:show, :edit, :update]

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

    end

    def edit
        if !(current_user.id == @item.user_id)
            redirect_to root_path
        end
    end

    def update
        if @item.update(item_params)
            redirect_to item_path(id: @item.id)
        else
            render :edit
        end
    end
    
    private
    def item_params
        params.require(:item).permit(:name, :infomation, :category_id, :status_id, :payer_id, :prefecture_id, :day_to_delivery_id, :price, :user_id, :image).merge(user_id: current_user.id)
    end

    def item_find
        @item = Item.find(params[:id])
    end
end
