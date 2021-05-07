class Transaction < ApplicationRecord
  validates :card, presence: true
  validates :fare, presence: true

  belongs_to :card, class_name: 'Card'
end
