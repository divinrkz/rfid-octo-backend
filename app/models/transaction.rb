class Transaction < ApplicationRecord
  validates :card, presence: true
  validates :fare, presence: true
  validates :initial_balance, presence: true
  validates :current_balance, presence: true

  belongs_to :card, class_name: 'Card'
end