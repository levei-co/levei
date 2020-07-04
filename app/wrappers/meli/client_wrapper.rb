class Meli::ClientWrapper

  def initialize(user)
    @user = user
  end

  def get_order_by_id(order_id)
    params = {seller: user.external_id, access_token: client.access_token}
    response = client.get("/orders/search", params)
    JSON.parse(response.body).deep_transform_keys(&:to_sym)
  end

  def get_me
    params = {access_token: client.access_token}
    response = client.get("/users/me", params)
    JSON.parse(response.body).deep_transform_keys(&:to_sym)
  end

  private

  def client
    @client ||= Meli.new(
      ENV['MELI_CLIENT_ID'],
      ENV['MELI_CLIENT_SECRET'],
      user.access_token,
      user.refresh_token
    )
  end

  attr_reader :user
end