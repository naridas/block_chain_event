class EventsController < ApplicationController
  def create
    if request.content_type =~ /json/ && JSON.parse(request.body.read) != nil
      data = JSON.parse(request.body.read)
      data.each do |currency, value|
        event = Event.where(currency: currency).first_or_create
        rate = ExchangeRate.create(event: event,
                                "15m": value["15m"],
                                buy: value["buy"],
                                sell: value["sell"],
                                last: value["last"],
                                symbol: value["symbol"])
      end
      return render plain: "OK", status: :ok
    end
    render plain: "ERROR", status: :internal_server_error
  end
end
