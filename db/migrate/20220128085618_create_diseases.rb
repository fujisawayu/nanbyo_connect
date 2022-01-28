class CreateDiseases < ActiveRecord::Migration[6.0]
  def change
    create_table :diseases do |t|
      t.string "name"
      t.string "number"
      t.timestamps
    end
  end
end
