class Router
  def initialize(item_controller, value_controller)
    @item_controller = item_controller
    @value_controller = value_controller
    @running = true
  end

  def run
    puts "Welcome to nighthawk"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @item_controller.list
    when 2 then @value_controller.merch
    when 3 then @value_controller.test
  #   when 2 then @controller.create
  #   when 3 then @controller.destroy
  #   when 4 then @controller.search
  #   when 5 then @controller.mark
    when 6 then stop
    else
      puts "Please press [1|2|3|4|5]"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all the items"
    puts "2 - Find Merch"
    puts "3 - test"
    puts "6 - Stop and exit the program"
  end
end
