class Order < ApplicationRecord
  attr_accessor :radio_number, :destination_id

  belongs_to :member

  enum payment_option: {
    bank_transfer: 1,
    credit_card: 2
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
    "〒" + postcode_view + " " + prefecture_name + address_city + address_street + address_building
  end

  def auto_update_work_status
    if self.status_before_type_cast == 2
      self.order_products.each do |op|
        op.update(work_status: 2)
      end
    end
  end
end
