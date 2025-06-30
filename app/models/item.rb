class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  
  belongs_to :category

  validates :title, :explanation, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :handing_time_id, :price, presence: true

  validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :handing_time_id, numericality: { other_than: 1, message: "を選択してください" }

  validate :image_presence

  private

  def image_presence
    errors.add(:image, "を選択してください") unless image.attached?
  end
end
