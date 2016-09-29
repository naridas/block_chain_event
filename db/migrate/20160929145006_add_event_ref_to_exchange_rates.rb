class AddEventRefToExchangeRates < ActiveRecord::Migration[5.0]
  def change
    add_reference :exchange_rates, :event, foreign_key: true
  end
end
