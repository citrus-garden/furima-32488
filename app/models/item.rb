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
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :satus
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :day_to_delivery
end
