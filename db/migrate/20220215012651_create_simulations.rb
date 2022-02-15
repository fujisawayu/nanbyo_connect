class CreateSimulations < ActiveRecord::Migration[6.0]
  def change
    create_table :simulations do |t|
      t.integer :diagnose_id
      t.integer :severitie_id
      t.integer :hierarchie_id
      t.integer :long_term_id
      t.integer :remark_id

      t.timestamps
    end
  end
end
