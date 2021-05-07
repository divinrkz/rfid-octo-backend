class Card < ApplicationRecord
  validates :uuid, presence: true
  validates :balance, presence: true

  has_many :transactions, class_name: 'Transaction', foreign_key: 'id'
end