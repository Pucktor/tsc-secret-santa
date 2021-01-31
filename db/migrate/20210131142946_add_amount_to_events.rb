class AddAmountToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :amount, :string
  end
end
