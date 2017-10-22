require 'spec_helper'

describe 'Vehicle Adapted' do
  let(:request) do
    {
        quote: {
            pickup_postcode:   'SW1A 1AA',
            delivery_postcode: 'EC2A 3LT',
            products: [
                {
                    weight: 5,
                    width: 20,
                    height: 20,
                    length: 20
                }
            ]
        }.to_json
    }
  end

  it 'responds vehicle adapted to the products ' do
    post '/quotes', request

    expect(last_response).to be_ok

    quote = JSON.parse(last_response.body)['quote']

    expect(quote['vehicle_id']).to eql "motorbike"
  end




end