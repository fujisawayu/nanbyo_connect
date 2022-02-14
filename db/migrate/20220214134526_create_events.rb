class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :scheduled_on
      t.string :place, default: "", null: false
      t.string :title, default: "", null: false
      t.text :content, default: "", null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
