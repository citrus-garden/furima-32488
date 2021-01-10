class AddressesController < ApplicationController
    def create
        @address = Address.new(address_params) 
    end

    private
    def address_params
        params.require(:address).permit.(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(:order_id)
    end
end
