class CreateRfidCards < ActiveRecord::Migration[6.1]
  def change
    create_table :rfid_cards, id: :uuid do |t|
      t.string :UUID
      t.boolean :enabled

      t.timestamps
    end
  end
end
