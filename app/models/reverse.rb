class Reverse < ApplicationRecord
  belongs_to :user
  has_one :shipping_address
  belongs_to :buyer
  has_many :products
  has_many :interactions

  enum status: %i[scheduled collected shipped delivered]
  enum reason: %i[exchange return]
  enum reason_change_to: %i[shift credit]
end
