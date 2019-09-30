require 'rails_helper'

RSpec.describe Currency, type: :request do
  describe 'GET /currencies/:id' do
    let(:currency) { FactoryBot.create(:currency) }
    let(:user) { FactoryBot.create(:user) }

    context 'when user unauthorized' do
      it 'returns 401 status' do
        get(currency_path(currency))

        expect(response.status).to eq 401
      end
    end

    context 'when user authorized' do
      it 'returns 200 status' do
        get(currency_path(currency), headers: { HTTP_BEARER_AUTH_TOKEN: user.access_token })

        expect(response.status).to eq 200

        json_response = JSON.parse(response.body)
        expect(json_response['id']).to eq(currency.id)
        expect(json_response['name']).to eq(currency.name)
        expect(json_response['rate']).to eq(currency.rate)
      end
    end
  end
end
