require 'test/unit'
require './lib/bulldoggy-thor/cli'

module BulldoggyThor
  class CLITest < Test::Unit::TestCase
    def setup
      @task_name = "Read Uncle Bob Articles"
      @cli = CLI.new
    end

    def test_add_task
      @cli.add_task(@task_name)

      assert_equal @task_name, Bulldoggy.fetch.first.fetch(:description)
    end
  end
end
