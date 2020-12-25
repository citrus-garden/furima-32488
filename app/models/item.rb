class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :infomation
    validates :category_id, numericality: { other_than: 1 }
    validates :satus_id, numericality: { other_than: 1 }
    validates :payer_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :day_to_delivery_id, numericality: { other_than: 1 }
    validates :price
  end

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :satus
  belongs_to_active_hash :payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day_to_delivery
end
