class Reverse < ApplicationRecord
  belongs_to :user
  has_one :shipping_address
  belongs_to :buyer
  has_many :products
  has_many :interactions

  enum status: %i[scheduled collected shipped delivered]
  enum reason: %i[exchange return]
  enum reason_change_to: %i[shift credit]

  def status_progress
    "#{((read_attribute_before_type_cast(:status) + 1) * 100)/4}%"
  end

  def status_badge
    if scheduled?
      'info'
    elsif delivered?
      'success'
    else
      'warning'
    end
  end

  def refund!
    update(refund_at: Datetime.now)
  end
end
