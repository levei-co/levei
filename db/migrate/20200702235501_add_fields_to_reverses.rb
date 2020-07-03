class AddFieldsToReverses < ActiveRecord::Migration[6.0]
  def change
    add_column :reverses, :reason_change_to, :integer
    rename_column :reverses, :order_id, :external_order_id
  end
end
