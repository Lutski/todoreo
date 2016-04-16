module Todoreo
  class TodoList
    def initialize
      @todoItems = []
    end

    def run_program
      puts "Type '--help' to see all of the commands"
      loop do
        input = gets.chomp
        case input
        when 'add'
          add_todo_item
        when 'all'
          show_todos
        when 'dot'
          delete_overlapped_todos
        when 'dst'
          print "Type the id of the todo you want to delete: "
          input = gets.chomp
          delete_specific_todo(input)
        when 'est'
          print "Type the id of the todo you want to edit: "
          input = gets.chomp
          edit_specific_todo(input)
        when 'exit'
          break
        when '--help', '-help', '-h', 'help'
          get_help
        when 'sweet love'
          puts "( ͡° ͜ʖ ͡°)\n  Oke"
        end
      end
    end

    def add_todo_item
      newTodoItem = TodoItem.new
      print "Write your todo: "
      newTodoItem.todo = gets.chomp
      print "How many days do you need to complete it: "
      newTodoItem.days = gets.chomp
      print "At what time of the day should it be complete (example: 12:45): "
      newTodoItem.time = gets.chomp
      @todoItems.push(newTodoItem)

      puts newTodoItem
      puts newTodoItem.time_created
    end

    def show_todos
      if @todoItems.count > 0
        puts "------------------------"
        puts "Here is your todo items"
      else
        puts "------------------------"
        puts "You have no todos yet.... Type 'add' to create one"
      end
      todoCounter = 1

      @todoItems.each do |item|
        time_until_due_date = item.time_created + (60 * 60 * 24 * item.days.to_i)

        todo_due_date = time_until_due_date.strftime("%Y-%m-%d")
        time_of_the_day = item.time

        if Time.now < time_until_due_date
          puts "[#{todoCounter}] #{item.todo} - Due at #{todo_due_date} on #{time_of_the_day}"
        else
          puts "[#{todoCounter}] #{item.todo} - Due date overlapped (Type 'dot' to delete all overlapped todos )"
        end
        todoCounter += 1
      end
    end

    def delete_overlapped_todos
      @todoItems.each do |item|
        time_until_due_date = item.time_created + (60 * 60 * 24 * item.days.to_i)
        if Time.now > time_until_due_date
          @todoItems.delete(item)
        end
      end

      show_todos()
    end

    def delete_specific_todo(id)
      todoCounter = 1
      @todoItems.each do |item|
        if id.to_i == todoCounter
          @todoItems.delete(item)
          puts "The todo: '#{item.todo}' was successfully deleted"
        end

        todoCounter += 1
      end

      show_todos()
    end

    def edit_specific_todo(id)
      todoCounter = 1

      @todoItems.each do |item|
        if id.to_i == todoCounter
          puts "What do you want to edit?"
          puts "'todo' to edit the todo content"
          puts "'days' to edit the days you have left"
          puts "'time' to edit the specific time you have to complete it"
          loop do
            decision = gets.chomp
            case decision
            when 'todo'
              print "Write your new version of that todo: "
              new_version = gets.chomp
              item.todo = new_version
              break
            when 'days'
              print "How many days do you want: "
              new_version = gets.chomp
              item.days = new_version
              break
            when 'time'
              print "What should the new time be?: "
              new_version = gets.chomp
              item.time = new_version
              break
            end
          end
          puts "Successfully updated the todo with id of [#{id}]"
        end
        todoCounter += 1
      end
    end

    def get_help
      puts "------------------------"
      puts "The help has arrived..."
      puts "Type 'add' to create a new todo"
      puts "Type 'all' to view all todos"
      puts "Type 'dst' to delete a specific todo via their id (1., 2. etc.)"
      puts "Type 'dot' to delete overlapped todos"
      puts "Type 'exit' to exit the application (all data will be saved)"
    end

  end
end
