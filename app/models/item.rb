class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee, class_name: 'ShippingFee'
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  has_one_attached :image

  validates :name, :description, :price, presence: true

  validates :price, numericality: { only_integer: true }

  validate :image_presence

  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  private

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
