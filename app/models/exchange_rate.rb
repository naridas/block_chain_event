class ExchangeRate < ApplicationRecord
  validates_presence_of :"15m", :last, :buy, :sell, :symbol
  belongs_to :event
end
