class VehicleGarage
  def initialize
    @vehicles = Hash.new()
  end

  def add_vehicle(vehicle)
    @vehicles[vehicle.name] = vehicle
  end

  def delivery_mark_up(vehicle_name)
    return @vehicles[vehicle_name].mark_up
  end

  def price_limit(price)
    result = Vehicle.new("no_vehicle_found", 1, 9999999, 0, 0, 0, 0)
    @vehicles.each_value do |vehicle|
      if vehicle.price > price && vehicle.price < result.price
        result = vehicle
      end
    end

    return result

  end



    def adapted_vehicle(products, priority = "size")
      size = 0
      weight = 0
      result = Vehicle.new("no_vehicle_found", 1, 9999999, 999999, 999999, 999999, 999999)

      products.each do |product|
        weight += product["weight"]
        size += product["length"] * product["width"] * product["height"]
      end

      @vehicles.each_value do |vehicle|

        if size < vehicle.size && weight < vehicle.weight

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

      return result.name


    end

  end