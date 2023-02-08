class Train
    attr_accessor :speed
    attr_accessor :current_station
    attr_reader :route
  
    def initialize(number, type, qtywagons)
      @number = number.to_i
      @type = type
      @qtywagons = qtywagons.to_i
      @speed = 0
      @route = nil
      @current_station = nil
    end
  
    def break_speed
      self.speed = 0
    end
  
    def show_wagons
      puts "Quantity of wagons = #{@qtywagons}"
    end
  
    def add_wagon
      if speed.zero?
        @qtywagons += 1
      else
        puts 'Train is moving'
      end
    end
  
    def remove_wagon
      if speed.zero?
        @qtywagons -= 1
      else
        puts 'Train is moving'
      end
    end
  
    def route=(route)
      @route = route
      @current_station = route.station_names.first
    end
  
    def move_forward
      route.station_names.each_with_index do |station, index|
        next unless station == current_station
        next if index == route.station_names.size - 1
        self.current_station = route.station_names[index + 1]
        break
        end
    end
  
    def move_back
      route.station_names.each_with_index do |station, index|
        next unless station == current_station
        next if index.zero?
        self.current_station = route.station_names[index - 1]
        
      end
    end
  end
  
  class Route
    attr_reader :station_names
  
    def initialize(first, last)
      @station_names = [first, last]
    end
  
    def add_station(sname)
      station_names.insert(-2, sname)
    end
  
    def show_allstations
      puts station_names
    end
  
    def delete_station(name)
      station_names.delete(name)
    end
  end


class Station
    def initialize(name)
      @name = name
      @cargotrain = []
      @passtrain = []
    end
    
    def add_cargotrain(tname)
        @cargotrain << tname 
    end
    
    def add_passtrain(tname)
        @passtrain << tname
    end

    def show_alltrains
        puts @cargotrain.size + @passtrain.size
    end

    def show_cargotrain
        puts "Q-ty of cargo trains on station = #{@cargotrain.size}"
    end

    def show_cargotrain
        puts "Q-ty of passanger trains on station = #{@passtrain.size}"
    end

    def departure_cargotrain(tname)
        @cargotrain.delete(tname)
    end
end
