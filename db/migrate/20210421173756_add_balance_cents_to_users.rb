class AddBalanceCentsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :balance_cents, :integer
  end
end
