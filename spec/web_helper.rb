def post_event(exchange_rates = {
              "GBP":{"15m": 464.22,
                "last": 464.22,
                "buy": 464.22,
                "sell": 465.04,
                "symbol": "£"},

              "USD":{"15m": 603.27,
                "last": 603.27,
                "buy": 603.27,
                "sell": 69022.1,
                "symbol": "$"}
             })

  post '/events',
        params: exchange_rates,
        as: :json
end
