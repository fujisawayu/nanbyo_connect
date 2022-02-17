class AddUserRefToSimulations < ActiveRecord::Migration[6.0]
  def change
    add_reference :simulations, :user, foreign_key: true
  end
end
