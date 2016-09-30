describe 'Geckoboard', type: :request do
  describe 'POST /geckoboard' do
    it 'returns 200 if a new entry is succesfully created' do
      post '/events'
      post '/geckoboard'
      expect(response).to have_http_status 200
    end

    it 'returns 500 if GECKO API key not valid' do
      post '/events'
      post '/geckoboard'
      expect(response).to have_http_status 500
    end
  end
end
