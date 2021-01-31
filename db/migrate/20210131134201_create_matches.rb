class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :event, index: true
      t.references :giver, index: true
      t.references :receiver, index: true
      t.timestamps
    end
    add_foreign_key :matches, :events
    add_foreign_key :matches, :participants, column: :giver_id
    add_foreign_key :matches, :participants, column: :receiver_id
  end
end
