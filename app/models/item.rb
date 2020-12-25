class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :infomation
    validates :category_id
    validates :satus_id
    validates :payer_id
    validates :prefecture_id
    validates :day_to_delivery_id	
    validates :price
  end
end
