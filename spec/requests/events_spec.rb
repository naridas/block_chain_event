describe 'Events', type: :request do
  describe 'POST /events' do
    it 'logs the events on the db' do
      expect{ post_event }.to change(Event, :count).by(2)
    end

    it 'logs the exchange rates on the db' do
      expect{ post_event }.to change(ExchangeRate, :count).by(2)
    end

    it 'returns 200 if a new entry is succesfully created' do
      post_event
      expect(response).to have_http_status 200
    end

    it 'returns 500 if a new entry is not created' do
      post_event(nil)
      expect(response).to have_http_status 500
    end
  end
end
