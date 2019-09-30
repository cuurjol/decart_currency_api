require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  before do
    expect(controller).to receive(:authorize).and_return(true)
  end

  describe '#index' do
    let!(:currencies) { FactoryBot.create_list(:currency, 3) }

    it 'returns list of currencies in the JSON format' do
      get(:index)

      json_response = JSON.parse(response.body)
      expect(json_response['currencies'].first['id']).to eq(currencies.first.id)
      expect(json_response['currencies'].second['id']).to eq(currencies.second.id)
      expect(json_response['currencies'].third['id']).to eq(currencies.third.id)

      expect(json_response['pagination']['current_page']).to eq(1)
      expect(json_response['pagination']['last_page']).to eq(1)
      expect(json_response['pagination']['prev_page_url']).to be_nil
      expect(json_response['pagination']['next_page_url']).to be_nil
    end
  end

  describe '#show' do
    let(:currency) { FactoryBot.create(:currency) }

    it 'returns a currency object in the JSON format' do
      get(:show, params: { id: currency.id })

      json_response = JSON.parse(response.body)
      expect(json_response['id']).to eq(currency.id)
      expect(json_response['name']).to eq(currency.name)
      expect(json_response['rate']).to eq(currency.rate)
    end
  end
end
