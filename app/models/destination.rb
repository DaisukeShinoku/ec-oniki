class Destination < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  
  validates :postcode, presence: true, format: {with: /\A\d{7}\z/}
  validates :prefecture_code, presence: true
  validates :address_city, presence: true, length: {maximum: 15}
  validates :address_street, presence: true, length: {maximum: 30}
  validates :address_building, length: {maximum: 30}
  validates :receiver, presence: true, length: {maximum: 30}

  def postcode_view
    self.postcode.to_s.insert(3, "-")
  end
  
  def fulladdress
    "〒" + postcode_view + " " + prefecture_name + address_city + address_street + address_building
  end

end
