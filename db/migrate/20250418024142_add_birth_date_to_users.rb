class AddBirthDateToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :birth_date, :date, null: false
  end
end
