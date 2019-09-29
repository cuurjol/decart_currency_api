class Currency < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :rate, presence: true
end
