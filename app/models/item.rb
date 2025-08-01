class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  
  belongs_to :user
  belongs_to :category
  belongs_to :handing_time
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :status

  validates :user, presence: true
  
  validates :title, :explanation, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :handing_time_id, :price, presence: true

  validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :handing_time_id, numericality: { other_than: 1, message: "を選択してください" }

  validate :image_presence

  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'は¥300〜¥9,999,999の間で入力してください'
  }

  private

  def image_presence
    errors.add(:image, "を選択してください") unless image.attached?
  end
end
