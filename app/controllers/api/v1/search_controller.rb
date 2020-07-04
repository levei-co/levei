class Api::V1::SearchController < ActionController::API
  def show
    render json: ml_response_mockup.to_json, status: :ok
  end

  private
  def ml_response_mockup
    {
      id: '1068825849',
      status: 'paid',
      order_items: [{
        item: {
          id: 'MLA607850752',
          title: 'Item De Testeo, Por Favor No Ofertar --kc:off',
          category_id: 'MLA3530',
        },
        quantity: 1,
        unit_price: 10
      }],
      total_amount: 10,
      buyer: {
        id: '207040551',
        nickname: 'TETE5029382',
        first_name: 'Test',
        last_name: 'Test',
        email: 'test_user_97424966@testuser.com'
      }
    }
  end
end