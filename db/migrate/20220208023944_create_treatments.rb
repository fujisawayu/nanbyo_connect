class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.date "affected_on"
      t.string "drug_name"
      t.text "content"
      t.text "advice"
      t.references :disease, foreign_key: true
      t.timestamps
    end
  end
end
