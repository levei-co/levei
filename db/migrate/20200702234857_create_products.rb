class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :external_id
      t.string :name
      t.decimal :price
      t.references :reverse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
