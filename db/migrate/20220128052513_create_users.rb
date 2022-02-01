class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string "name"
      t.date "birthday"
      t.integer "prefecture"
      t.text "self_introduction"
      t.string "icon"
      t.integer "classification"
      t.timestamps
    end
  end
end
