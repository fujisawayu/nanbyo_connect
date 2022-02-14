class ChangeImageDefaultOfUser < ActiveRecord::Migration[6.0]
  def down
    change_column :users, :image, :string, null: false
    change_column :users, :age, :integer, null: false
  end

  def up
    change_column :users, :image, :string, null: true
    change_column :users, :age, :integer, null: true
  end
end
