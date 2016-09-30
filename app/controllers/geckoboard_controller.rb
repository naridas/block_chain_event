class GeckoboardController < ApplicationController
  require 'geckoboard'

  def create
    @client = Geckoboard.client(ENV["GECKO"])
    @events = Event.all
    if @client.ping
      @events.each do |event|
        date = Date.parse(event.created_at.to_s)
        dataset = @client.datasets.find_or_create('bitcoin.exchange', fields: [
          Geckoboard::MoneyField.new(:amount,
                                      name: 'Buy',
                                      currency: event.currency),
          Geckoboard::MoneyField.new(:amount,
                                      name: 'Sell',
                                      currency: event.currency),
          Geckoboard::DateTimeField.new(timestamp: DateTime.iso8601(date.to_s),
                                        name: 'Time'),
        ])
        # trying to create a dataset for each exchange_rate in the database
        # event.exchange_rates.each do |exchange_rate|
        #   p event.currency
        #   p exchange_rate.buy
        #   dataset = client.datasets.find_or_create('bitcoin.exchange', fields: [
        #     Geckoboard::MoneyField.new(amount: exchange_rate.buy,
        #                                 name: 'Buy',
        #                                 currency_code: event.currency),
        #     Geckoboard::MoneyField.new(amount: exchange_rate.sell,
        #                                 name: 'Sell',
        #                                 currency_code: event.currency),
        #     Geckoboard::DateTimeField.new(timestamp: DateTime.new(exchange_rate.created_at),
        #                                   name: 'Time'),
        #   ])
        # end
      end
      # return render plain: "OK", status: :ok
    end
    render plain: "ERROR", status: :internal_server_error
  end
end
