describe 'Events', type: :request do
  describe 'POST /events', :vcr do
    it 'logs the events on the db' do
      expect{ post '/events' }.to change(Event, :count).by(21)
    end

    it 'logs the exchange rates on the db' do
      expect{ post '/events' }.to change(ExchangeRate, :count).by(21)
    end

    it 'returns 200 if a new entry is succesfully created' do
      post '/events'
      expect(response).to have_http_status 200
    end

    it 'returns 500 if not json' do
      post '/events'
      expect(response).to have_http_status 500
    end

    it 'returns 500 if body nil' do
      post '/events'
      expect(response).to have_http_status 500
    end
  end
end
