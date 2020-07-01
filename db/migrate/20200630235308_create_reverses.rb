class CreateReverses < ActiveRecord::Migration[6.0]
  def change
    create_table :reverses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_id
      t.integer :status
      t.integer :reason

      t.timestamps
    end
  end
end
