class AddBuyerIdToReverse < ActiveRecord::Migration[6.0]
  def change
    add_reference :reverses, :buyer
  end
end
