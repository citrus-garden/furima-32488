class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :infomation
    validates :category_id, numericality: { other_than: 1 }
    validates :satus_id
    validates :payer_id
    validates :prefecture_id
    validates :day_to_delivery_id	
    validates :price
  end

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
