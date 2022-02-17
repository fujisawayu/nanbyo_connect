class ChangeColumnsAddNotnull < ActiveRecord::Migration[6.0]
  def change
    change_column :diseases, :name, :string, null: false
    change_column :diseases, :number, :string, null: false
    change_column :expenses, :treatment_cost, :string, null: false
    change_column :expenses, :drug_cost, :string, null: false
    change_column :expenses, :other_cost, :string, null: false
    change_column :treatments, :affected_on, :date, null: false
    change_column :treatments, :drug_name, :string, null: false
    change_column :treatments, :content, :text, null: false
    change_column :treatments, :advice, :text, null: false
  end
end
