class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards, id: :uuid do |t|
      t.string :uuid
      t.decimal(:balance, default: 0)
      t.boolean(:enabled, default: true)

      t.timestamps
    end
  end
end
