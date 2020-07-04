class DashboardReport
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def last_reverses
    reverses.reverse_chronologically.limit(5)
  end

  def reverses_with_status(status)
    reverses.public_send("#{status}").count
  end

  def exchange_reverses
    @exchange_reverses ||= reverses.exchange
  end

  def return_reverses
    @return_reverses ||= reverses.return
  end

  def return_revert_credit
    @return_revert_credit ||= reverses.return.credit
  end

  def return_revert_exchange
    @return_revert_exchange ||= reverses.return.shift
  end

  def exchange_products
    reverse_ids = reverses.exchange.pluck(:id)
    @exchange_products ||= Product.where(reverse_id: reverse_ids)
  end

  def return_products
    reverse_ids = reverses.return.pluck(:id)
    @return_products ||= Product.where(reverse_id: reverse_ids)
  end

  private

  def reverses
    @reverses ||= user.reverses
  end
end