require 'ostruct'
require 'minitest/autorun'
require 'better_dash_cli'

module BetterDashCli
  
  class ArgumentParserTest < Minitest::Test    
    def test_nil_arguments
      assert_raises ArgumentError do
        BetterDashCli::ArgumentParser.parse
      end
    end

    def test_zero_arguments
      args = []
      assert_raises ArgumentError do
        BetterDashCli::ArgumentParser.parse(args)
      end
    end

    def test_one_argument
      args = %w"get_the_excerpt"
      expected = OpenStruct.new(:language => nil, :keyword => 'get_the_excerpt')
      assert_equal expected, BetterDashCli::ArgumentParser.parse(args)
    end

    def test_two_arguments
      args = %w"wordpress get_the_excerpt"
      expected = OpenStruct.new(:language => 'wordpress', :keyword => 'get_the_excerpt')
      assert_equal expected, BetterDashCli::ArgumentParser.parse(args)
    end
  
    def test_more_than_two_arguments
      args = %w"wordpress get_the_excerpt foo bar"
      assert_raises ArgumentError do
        BetterDashCli::ArgumentParser.parse(args)
      end
    end
  end

  class DashTest < Minitest::Test
    def test_language_and_keyword_command
      options = %w'wordpress get_the_excerpt'
      dash = BetterDashCli::Dash.new(options)
      assert_equal "dash://wordpress:get_the_excerpt", dash.command
    end
  
    def test_keyword_command
      options = %w'get_the_excerpt'
      dash = BetterDashCli::Dash.new(options)
      assert_equal "dash://get_the_excerpt", dash.command
    end  
  end

end
