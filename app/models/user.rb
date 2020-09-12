class User < ApplicationRecord

  before_save { self.email = email.downcase }

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  validates :first_name, presence: true, length: {maximum: 10}
  validates :last_name, presence: true, length: {maximum: 10}
  validates :first_name_kana, presence: true, length: {maximum: 10}, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :last_name_kana, presence: true, length: {maximum: 10}, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_roman, presence: true, length: {maximum: 20}, format: { with: /\A[A-Z]+\z/, message: 'は半角英大文字で入力して下さい。'}
  validates :last_name_roman, presence: true, length: {maximum: 20}, format: { with: /\A[A-Z]+\z/, message: 'は半角英大文字で入力して下さい。'}

  validates :birthday, presence: true

  validates :postcode, presence: true, format: {with: /\A\d{7}\z/}
  validates :prefecture_code, presence: true
  validates :address_city, presence: true, length: {maximum: 15}
  validates :address_street, presence: true, length: {maximum: 30}
  validates :address_building, length: {maximum: 30}

  validates :is_valid, inclusion: { in: [true, false] }

  VALID_ACCOUNT_REGEX = /\A[0-9a-z_]{1,15}\z/i
  validates :account_id, presence: true, length: {in: 6..15}, format: { with: VALID_ACCOUNT_REGEX }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :cart_products, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :orders

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def fullname
    last_name + first_name
  end

  def postcode_view
    self.postcode.to_s.insert(3, "-")
  end
  
  def fulladdress
    "〒" + postcode_view + " " + prefecture_name + address_city + address_street + address_building
  end

end
