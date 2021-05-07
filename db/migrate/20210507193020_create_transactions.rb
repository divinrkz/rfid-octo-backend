class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :card
      t.decimal :initial_balance
      t.boolean :current_balance
      t.boolean :fare

      t.timestamps
    end
  end
end
