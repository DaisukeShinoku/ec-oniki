class Destination < ApplicationRecord

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

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
    if self.address_building?
      "〒" + postcode_view + " " + prefecture_name + " " + address_city + " " + address_street + " " + address_building
    else
      "〒" + postcode_view + " " + prefecture_name + " " + address_city + " " + address_street
    end
  end

end
