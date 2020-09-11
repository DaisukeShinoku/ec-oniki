class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :area

  has_many :cart_products, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :is_valid, inclusion: { in: [true, false] }

  def price_tax
    self.price * 1.1
  end
  
end
