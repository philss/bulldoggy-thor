require 'test/unit'
require './lib/bulldoggy-thor/cli'

module BulldoggyThor
  class CLITest < Test::Unit::TestCase
    def test_add_task
      task_name = "Read Uncle Bob Articles"
      CLI.new.add_task(task_name)

      assert_equal task_name, Bulldoggy.fetch.first.fetch(:description)
    end
  end
end
