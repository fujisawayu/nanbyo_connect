class ChangeDefaultOfUser < ActiveRecord::Migration[6.0]
  def down
    change_column :users, :name, :string, null: false
    change_column :users, :birthday, :date, null: false
    change_column :users, :prefecture, :integer, default: 0, null: false
    change_column :users, :self_introduction, :text, null: false
    change_column :users, :classification, :integer, default: 0, null: false
  end

  def up
    change_column :users, :name, :string, null: true
    change_column :users, :birthday, :date, null: true
    change_column :users, :prefecture, :integer, default: 0, null: true
    change_column :users, :self_introduction, :text, null: true
    change_column :users, :classification, :integer, default: 0, null: true
  end
end
