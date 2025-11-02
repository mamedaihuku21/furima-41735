class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building,
                :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    item = Item.find(item_id)

    order = Order.create(
      item_id: item_id,
      user_id: user_id,
      price: item.price
    )

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: street_address,
      building_name: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end