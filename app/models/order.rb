class Order < ApplicationRecord

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  attr_accessor :radio_number, :destination_id

  belongs_to :user
  has_many :order_products

  enum payment_option: {
    bank_transfer: 1,
    credit_card: 2
  }

  enum order_status: {
    unpaid: 1,
    paid: 2,
    working: 3,
    ready: 4,
    shipped: 5
  }

  validates :user_id, presence: true
  
  validates :postcode, presence: true, format: {with: /\A\d{7}\z/}
  validates :prefecture_code, presence: true
  validates :address_city, presence: true, length: {maximum: 15}
  validates :address_street, presence: true, length: {maximum: 30}
  validates :address_building, length: {maximum: 30}
  validates :receiver, presence: true, length: {maximum: 30}

  validates :payment_option, presence: true
  validates :status, presence: true
  validates :postage, presence: true
  validates :billing, presence: true

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

  def auto_update_work_status
    if self.status_before_type_cast == 2
      self.order_products.each do |op|
        op.update(work_status: 2)
      end
    end
  end
end
