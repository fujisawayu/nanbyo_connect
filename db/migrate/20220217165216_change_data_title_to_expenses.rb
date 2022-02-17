class ChangeDataTitleToExpenses < ActiveRecord::Migration[6.0]
  def change
    change_column :expenses, :treatment_cost, :integer, using: "treatment_cost::integer"
    change_column :expenses, :drug_cost, :integer, using: "drug_cost::integer"
    change_column :expenses, :other_cost, :integer, using: "other_cost::integer"
  end
end
