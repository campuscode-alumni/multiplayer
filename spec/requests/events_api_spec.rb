require 'rails_helper'

RSpec.describe 'Events API' do
  describe 'list events' do
    it 'should list all events' do
      create(:event, title: 'Jogatina')
      create(:event, title: 'Jogo dos Top')
      create(:event, title: 'Jogatina Noob')

      # chamada para a api
      get '/api/v1/events'

      # expectativas
      expect(response.status).to eq(200)
      expect(response.body).to include 'Jogatina'
      expect(response.body).to include 'Jogo dos Top'
      expect(response.body).to include 'Jogatina Noob'
    end
  end

  describe 'get event' do
    it 'should get an event that does not exist' do
      get '/api/v1/events/999'

      expect(response.status).to eq(404)
      expect(response.body).to include 'Não existe um evento com o ID informado'
    end
  end
end
