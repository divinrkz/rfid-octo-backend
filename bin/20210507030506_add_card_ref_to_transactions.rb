class AddCardRefToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :card, null: false, foreign_key: true, type: :uuid
  end
end
