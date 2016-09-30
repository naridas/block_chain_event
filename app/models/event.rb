class Event < ApplicationRecord
  validates_presence_of :currency
  has_many :exchange_rates
end
