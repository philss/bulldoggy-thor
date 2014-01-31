require 'test/unit'
require './lib/bulldoggy-thor/api'

module BulldoggyThor
  class APITest < Test::Unit::TestCase
    def test_add_task
      task_name = "Read Uncle Bob Articles"
      API.new.add_task(task_name)

      assert_equal task_name, Bulldoggy.fetch.first.fetch(:description)
    end

    #def test_remove_task
      #Bulldoggy.add_task("New Task")
      #API.new.remove_task(1)

      #assert Bulldoggy.fetch.empty?
    #end
  end
end
