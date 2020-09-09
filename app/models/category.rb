class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :is_valid, inclusion: {in: [true, false]}
end
