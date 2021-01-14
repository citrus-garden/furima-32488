require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入機能" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context "購入できる場合" do
      it "必要な値が全て入力されていれば購入できること" do
        expect(@order_address).to be_valid
      end

      it "buildingが存在しなくても購入できること" do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context "購入できない場合" do
      it "tokenが存在しないと購入できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが存在しないと購入できないこと" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it "postal_codeが「(三桁の数字)-(四桁の数字)」で書かれていないと購入できないこと" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが全角数字だと購入できないこと" do
        @order_address.postal_code = "１２３-４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeのハイフンが全角だと購入できないこと" do
        @order_address.postal_code = "123ー4567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "prefecture_idが存在しないと購入できないこと" do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it "prefecture_idが1だと購入できないこと" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "cityが存在しないと購入できないこと" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "addressが存在しないと購入できないこと" do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが存在しないと購入できないこと" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが全角数字だと購入できないこと" do
        @order_address.phone_number = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
