class Transaction < ApplicationRecord
  validates :card, presence: true
  validates :fare, presence: true
end
