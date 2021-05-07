class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards, id: :uuid do |t|
      t.string :uuid
      t.decimal :balance
      t.boolean :enabled

      t.timestamps
    end
  end
end
