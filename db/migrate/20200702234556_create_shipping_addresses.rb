class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :address1
      t.string :address2
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.string :zipcode
      t.references :reverse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
