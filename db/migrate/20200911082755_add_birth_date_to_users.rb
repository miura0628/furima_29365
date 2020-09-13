class AddBirthDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birth_date, :date
    add_index :users, :birth_date, null: false
  end
end
