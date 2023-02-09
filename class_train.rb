class Train
    attr_accessor :speed
    attr_accessor :current_station
    attr_reader :route
  
    def initialize(number, type, quantity_wagons)
      @number = number.to_i
      @type = type
      @quantity_wagons = quantity_wagons.to_i
      @speed = 0
      @train={}
      @train[@number]=@type
    end
  
    def break_speed
      self.speed = 0
    end
  
    def show_wagons
      puts "Quantity of wagons = #{@quantity_wagons}"
    end

    def show_type(number)
        puts "Train type is #{@train[number]}"
    end

    def add_wagon
      if speed.zero?
        @quantity_wagons += 1
      else
        puts 'Train is moving'
      end
    end
  
    def remove_wagon
      if speed.zero?
        @quantity_wagons -= 1
      else
        puts 'Train is moving'
      end
    end
  
    def route=(route)
      @route = route
      @current_station = route.stations.first
      puts "Поезд на станции #{@current_station}"
    end
  
    def move_forward
      route.stations.each_with_index do |station, index|
        next unless station == current_station
        next if index == route.stations.size - 1
        self.current_station = route.stations[index + 1]
        break
        end
        puts "Поезд на станции #{@current_station}"
    end
  
    def move_back
      route.stations.each_with_index do |station, index|
        next unless station == current_station
        next if index.zero?
        self.current_station = route.stations[index - 1]
        
      end
    end
    puts "Поезд на станции #{@current_station}"
  end
  
  class Route
    attr_reader :stations
  
    def initialize(first, last)
      @stations = [first, last]
    end
  
    def add_station(sname)
        stations.insert(-2, sname)
    end
  
    def show_allstations
      puts stations
    end
  
    def delete_station(name)
        stations.delete(name)
    end
  end


  class Station
  
    
    def initialize(name)
      @name = name
      @trains = {}
    end
    
    def add_train(type, tname)
        @trains[type] = tname 
    end
    
    
    def show_alltrains
       puts @trains
    end

    def show_cargotrain
        puts @trains["cargo"]
    end

    def show_passengertrain
        puts @trains["passenger"]
    end

    def departure_train(tname)
        @trains.delete_if { |k,v| v == tname }
    end
end



st=Station.new 'Kal'   #проверка станции
st.add_train('cargo', 'qwe')
st.add_train('passenger', 'ewq')
st.show_alltrains
st.show_cargotrain
st.show_passengertrain
st.departure_train('qwe')
st.show_alltrains
puts "============================================================"
train1=Train.new '123', 'cargo' , '45'  #проверка поезда
  train1.speed = 20
  train1.show_wagons
  train1.show_type(123)
  train1.add_wagon
  train1.show_wagons
  train1.break_speed
  train1.add_wagon
  train1.show_wagons
puts "============================================================"
  route1 = Route.new 'Kaliningrad' , 'Svetlogorsk' # проверка маршрута
  route1.add_station('Zelenogradsk')
  route1.show_allstations
puts "============================================================="
  train1.route=route1 #дали поезду существующий маршрут
  train1.move_forward #покатали его
  train1.move_forward
  train1.move_back