require 'sinatra'
require 'json'

module GameOfShutl
  class Server < Sinatra::Base
    post '/quotes' do
      quote = JSON.parse(params['quote'])

      price = ((quote['pickup_postcode'].to_i(36) - quote['delivery_postcode'].to_i(36)) / 1000).abs


      garage = VehicleGarage.default_garage

      #first solution: user gives which vehicle he wants
      #adapted_vehicle = quote["vehicle"]



      adapted_vehicle = garage.adapted_vehicle(quote["products"], price)
      price = price + garage.delivery_mark_up(adapted_vehicle) * price








      {
        quote: {
          pickup_postcode: quote['pickup_postcode'],
          delivery_postcode: quote['delivery_postcode'],
          price: price,
          vehicle: adapted_vehicle.name

        }
      }.to_json
    end
  end
end