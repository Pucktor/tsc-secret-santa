class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.references :event, index: true
      t.timestamps
    end
    add_foreign_key :participants, :events
  end
end
