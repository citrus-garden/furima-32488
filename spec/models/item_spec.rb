require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
    end

    context "出品できる場合" do
      it "値が全て正しく存在していれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "出品できない場合" do
      it "imageが存在しないと出品できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが存在しないと出品できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "infomationが存在しないと出品できないこと" do
        @item.infomation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Infomation can't be blank")
      end

      it "category_idが1だと出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "status_idが1だと出品できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "payer_idが1だと出品できないこと" do
        @item.payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer must be other than 1")
      end

      it "prefecture_idが1だと出品できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "day_to_delivery_idが1だと出品できないこと" do
        @item.day_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to delivery must be other than 1")
      end

      it "priceが存在しないと出品できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが全角数字だと出品できないこと" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceに記号が含まれていると出品できないこと" do
        @item.price = 300.0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end

      it "priceが300未満だと出品できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priseが1千万以上だと出品できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
