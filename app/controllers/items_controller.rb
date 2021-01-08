class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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

    def edit
        @item = Item.find(params[:id])
        if !(current_user.id == @item.user_id)
            redirect_to root_path
        end
    end

    def update
        @item = Item.find(params[:id])
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
end
