class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  validates :postal_code, presence: true,
                          format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :user_id, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true,
                           format: { with: /\A\d{10,11}\z/, message: 'is invalid' },
                           numericality: { only_integer: true, message: 'is invalid. Input only number' },
                           length: { minimum: 10, maximum: 11, message: 'is too short' }
  # validates :token, presence: true

  def save
    # return false unless valid?
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end

  def item_is_not_sold
    return unless Order.exists?(item_id: item_id)

    errors.add
  end
end
