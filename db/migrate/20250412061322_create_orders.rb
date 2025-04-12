class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :item, null: false, foreign_key: true  # 外部キーの設定
      t.references :user, null: false, foreign_key: true  # 外部キーの設定
      t.string :title, null: false
      t.string :image, null: false 
      t.integer :price, null: false
      t.timestamps
    end
  end
end