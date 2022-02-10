class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer "treatment_cost"
      t.integer "drug_cost"
      t.integer "other_cost"
      t.references :disease, foreign_key: true
      t.timestamps
    end
  end
end
