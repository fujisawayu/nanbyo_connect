class AddAgeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer, default: 0, null: false
  end
end
