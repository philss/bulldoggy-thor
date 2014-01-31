require 'thor'
require 'bulldoggy'

module BulldoggyThor
  class CLI < ::Thor
    desc "add_task DESCRIPTION", "Type a task to create with DESCRIPTION"
    def add_task(description)
      task = Bulldoggy.add_task(description)
      puts "id: #{task.id}, description: #{task.description}"
    end

    desc "remove_task TASK_ID", "Removes a task with TASK_ID"
    def remove_task(task_id)
      Bulldoggy.remove_task(task_id)
    end

    desc "fetch", "fetches all tasks"
    def fetch
      tasks = Bulldoggy.fetch
      puts tasks
    end

    desc "check_task TASK_ID", "Mark a task as done"
    def check_task(task_id)
      Bulldoggy.check_task(task_id)
    end

    desc "uncheck_task TASK_ID", "Mark a task as undone"
    def uncheck_task(task_id)
      Bulldoggy.uncheck_task(task_id)
    end
  end
end

BulldoggyThor::CLI.start(ARGV)
