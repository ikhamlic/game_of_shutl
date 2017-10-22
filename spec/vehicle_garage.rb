class VehicleGarage
  def initialize
    @vehicles = Hash.new()
  end

  def add_vehicle(vehicle)
    @vehicles[vehicle.name] = vehicle
    self
  end


  def delivery_mark_up(vehicle_name)
    return @vehicles[vehicle_name].mark_up
  end





    def adapted_vehicle(products, price, priority = "size")
      size = 0
      weight = 0
      result = Vehicle.new("no_vehicle_found", 1, 9999999, 999999, 999999, 999999, 999999)

      products.each do |product|
        weight += product["weight"]
        size += product["length"] * product["width"] * product["height"]
      end

      @vehicles.each_value do |vehicle|

        if size < vehicle.size && weight < vehicle.weight && vehicle.price_limit > price && vehicle.price_limit < result.price_limit

          case priority
            when "size"
              if vehicle.size < result.size
                result = vehicle
              end
            when "weight"
              if vehicle.weight < result.weight
                result = vehicle
              end

          end

        end
      end
      

      return result


    end




    def self.default_garage
      garage = VehicleGarage.new()
      garage.add_vehicle(Vehicle.new("bicycle", 0.1, 500, 30, 25, 10, 3))
          .add_vehicle(Vehicle.new("motorbike", 0.15, 750, 35, 25, 25, 6))
          .add_vehicle(Vehicle.new("parcel_car", 0.2, 1000, 100, 100, 75, 50))
          .add_vehicle(Vehicle.new("small_van", 0.3, 1500, 133, 133, 133, 400))
          .add_vehicle(Vehicle.new("large_van", 0.4, 9999999, 9999999, 9999999, 9999999, 9999999))


      return garage
    end

  end