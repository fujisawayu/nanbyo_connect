class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :prefecture, :integer
    add_column :users, :self_introduction, :text
    add_column :users, :image, :string
    add_column :users, :classification, :integer
  end
end
