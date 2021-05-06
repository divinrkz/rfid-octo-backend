class RfidCard < ApplicationRecord
  validates :UUID, presence: true
end
