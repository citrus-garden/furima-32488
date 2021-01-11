class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :infomation
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :status_id
        validates :payer_id
        validates :prefecture_id
        validates :day_to_delivery_id
    end
  end

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :day_to_delivery
end
