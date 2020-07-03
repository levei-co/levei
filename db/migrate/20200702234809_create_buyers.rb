class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :external_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
