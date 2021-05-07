class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.uuid :card
      t.decimal :fare
      t.decimal :initial_balance
      t.decimal :new_balance

      t.timestamps
    end
  end
end
