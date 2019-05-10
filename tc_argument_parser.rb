
require_relative "argument_parser"
require "test/unit"

class TestArgumentParser < Test::Unit::TestCase

  def test_find_main_command
    arguments = ArgumentParser.new("ls")
    assert_equal("ls", arguments.command)
  end

  def test_finds_argument_list
    arguments = ArgumentParser.new("ls -a -b -c")
    assert_equal("ls", arguments.command)
    assert_equal(3, arguments.parameters.count)

    assert_equal('-a', arguments.parameters[0])
    assert_equal('-b', arguments.parameters[1])
    assert_equal('-c', arguments.parameters[2])
  end

  def test_find_target
    arguments = ArgumentParser.new("add 01_entry")
    assert_equal("add", arguments.command)
    assert_equal("01_entry", arguments.target)
  end

end
