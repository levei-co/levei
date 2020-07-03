class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.references :reverse, null: false, foreign_key: true
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
