class User < ApplicationRecord

  before_save { self.email = email.downcase }

  with_options presence: true do
    validates :email
    validates :account_id
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :first_name_roman
    validates :last_name_roman
    validates :gender
    validates :birthday
    validates :postcode
    validates :prefecture_code
    validates :address_city
    validates :address_street
    validates :is_valid
  end

  VALID_ACCOUNT_REGEX = /\A[0-9a-z_]{1,15}\z/i
  validates :account_id, length: {in: 6..15}, format: { with: VALID_ACCOUNT_REGEX }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
