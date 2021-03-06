require 'thor'
require 'bulldoggy'
require 'bulldoggy-filesystem'

BulldoggyFilesystem::Repositories::Tasks.filename = './.tasks.yaml'

repo = BulldoggyFilesystem::Repositories::Tasks.new
Bulldoggy::Repository.register :task, repo

module BulldoggyThor
  class CLI < ::Thor

    desc "add_task DESCRIPTION", "Type a task to create with DESCRIPTION"
    def add_task(description)
      task = Bulldoggy.add_task(description)
      log_task(task)
    end

    desc "remove_task TASK_ID", "Removes a task with TASK_ID"
    def remove_task(task_id)
      task = fetch_by_task_id(task_id)
      if task
        puts "Removing task #{task.fetch(:description)}"
        Bulldoggy.remove_task(task_id)
      else
        puts "Task with id #{task_id} not found"
      end
    end

    desc "fetch", "fetches all tasks"
    def fetch
      tasks = Bulldoggy.fetch
      puts "Tasks count: #{tasks.size}"

      tasks.each do |task|
        puts "id: #{task.fetch(:id)}, description: #{task.fetch(:description)}, done: #{task.fetch(:done)}"
      end
    end

    desc "check_task TASK_ID", "Mark a task as done"
    def check_task(task_id)
      task = fetch_by_task_id(task_id)
      if task
        puts "Checking task #{task.fetch(:description)}"
        Bulldoggy.check_task(task_id)
      else
        puts "Task with id #{task_id} not found"
      end
    end

    desc "uncheck_task TASK_ID", "Mark a task as undone"
    def uncheck_task(task_id)
      task = fetch_by_task_id(task_id)
      if task
        puts "Unchecking task #{task.description}"
        Bulldoggy.uncheck_task(task_id)
      else
        puts "Task with id #{task_id} not found"
      end
    end

    private

    def log_task(task)
      puts "id: #{task.id}, description: #{task.description}"
    end

    def fetch_by_task_id(task_id)
      Bulldoggy.fetch.detect do |task|
        task.fetch(:id).to_i == task_id.to_i
      end
    end
  end
end

BulldoggyThor::CLI.start(ARGV)
