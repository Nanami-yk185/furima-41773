class AddLastNameKanaToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_name_kana, :string, null: false, default: ""
  end
end
