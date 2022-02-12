class CreateOnsets < ActiveRecord::Migration[6.0]
  def change
    create_table :onsets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :disease, null: false, foreign_key: true
      t.timestamps
    end
  end
end
