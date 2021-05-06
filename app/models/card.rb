class Card < ApplicationRecord
  validates :uuid, presence: true
  validates :balance, presence: true
end
