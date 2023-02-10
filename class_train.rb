class Train
  attr_accessor :speed
  attr_accessor :current_station
  attr_reader :route

  def initialize(number, type, quantity_wagons)
    @quantity_wagons = quantity_wagons.to_i
    @speed = 0
    @number = []
    @type = []
    @number << number
    @type << type

  end

  def break_speed
    self.speed = 0
  end

  def show_wagons
    puts "Quantity of wagons = #{@quantity_wagons}"
  end

  def show_type(number)
      @number.each_with_index do |e,i| 
        @type.each_with_index do |x, y|
          puts "train #{e}, type #{x}"
        end
      end
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
  end

  def move_forward
    route.stations.each_with_index do |station, index|
      next unless station == current_station
      next if index == route.stations.size - 1
      self.current_station = route.stations[index + 1]
      break
      end
  end

  def move_back
    route.stations.each_with_index do |station, index|
      next unless station == current_station
      next if index.zero?
      self.current_station = route.stations[index - 1]
      
    end
  end
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
      @trains = []
    end
  
    def show_trains
      puts @trains
    end

    def add_train(train)
      @trains << train
    end
  
    
    def show_type(type)
      @trains.select(type)
    end
  
    
    def delete(train)
      @trains.delete(train)
    end
  end






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


  st=Station.new 'Kal'   #проверка станции
  st.add_train(train1)
  st.show_trains
