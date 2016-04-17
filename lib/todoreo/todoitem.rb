module Todoreo
  class TodoItem
    attr_accessor :todo, :days #, :time

    @@todo_id = 0
    def initialize
      @time_created = Time.now
      @@todo_id += 1
    end

    def time_created
      @time_created
    end

    def todo_id
      @@todo_id
    end
  end
end
