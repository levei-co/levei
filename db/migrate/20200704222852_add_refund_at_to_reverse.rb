class AddRefundAtToReverse < ActiveRecord::Migration[6.0]
  def change
    add_column :reverses, :refund_at, :datetime
  end
end
