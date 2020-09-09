class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :area

  def price_tax
    self.price * 1.1
  end
  
end
