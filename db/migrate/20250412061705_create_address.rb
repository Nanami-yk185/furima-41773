class CreateAddress < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :postal_code
      t.string :prefecture
      t.string :city
      t.string :line1
      t.string :line2
      t.string :phone_number
      t.timestamps
    end
  end
end