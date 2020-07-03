class DashboardReport
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def exchange_reverses
    @exchange_reverses ||= reverses.exchange
  end

  def return_reverses
    @return_reverses ||= reverses.return
  end

  def exchange_products
    @exchange_products ||= reverses.exchange.map(&:products)
  end

  def return_products
    @return_products ||= reverses.return.map(&:products)
  end

  private

  def reverses
    @reverses ||= user.reverses
  end
end