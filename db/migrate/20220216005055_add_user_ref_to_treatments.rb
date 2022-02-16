class AddUserRefToTreatments < ActiveRecord::Migration[6.0]
  def change
    add_reference :treatments, :user, foreign_key: true
  end
end
