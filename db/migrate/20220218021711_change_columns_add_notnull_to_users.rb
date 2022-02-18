class ChangeColumnsAddNotnullToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :age, :integer, null: false
    change_column :users, :prefecture, :integer, null: false
  end
end
