class AddUserRefToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_reference :expenses, :user, foreign_key: true
  end
end
