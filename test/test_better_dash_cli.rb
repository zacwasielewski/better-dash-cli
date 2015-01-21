require 'ostruct'
require 'minitest/autorun'
require 'better_dash_cli'

module BetterDashCli
  
  class ArgumentParserTest < Minitest::Test
    def test_validating_nil_arguments
      assert_raises ArgumentError do
        BetterDashCli::ArgumentParser.validate!
      end
    end

    def test_validating_zero_arguments
      assert_raises ArgumentError do
        BetterDashCli::ArgumentParser.validate!([])
      end
    end

    def test_validating_one_argument
      args = %w"get_the_excerpt"
      assert_equal true, BetterDashCli::ArgumentParser.validate!(args)
    end

    def test_validating_two_arguments
      args = %w"wordpress get_the_excerpt"
      assert_equal true, BetterDashCli::ArgumentParser.validate!(args)
    end

    def test_validating_too_many_arguments
      args = %w"wordpress get_the_excerpt foo bar"
      assert_raises ArgumentError do
        BetterDashCli::ArgumentParser.validate!(args)
      end
    end
    
    def test_parsing_one_argument
      args = %w"get_the_excerpt"
      expected = OpenStruct.new(:language => nil, :keyword => 'get_the_excerpt')
      assert_equal expected, BetterDashCli::ArgumentParser.parse(args)
    end

    def test_parsing_two_arguments
      args = %w"wordpress get_the_excerpt"
      expected = OpenStruct.new(:language => 'wordpress', :keyword => 'get_the_excerpt')
      assert_equal expected, BetterDashCli::ArgumentParser.parse(args)
    end
    
    def test_parsing_wrong_number_of_arguments
      args = %w"wordpress get_the_excerpt foo bar"
      expected = OpenStruct.new(:language => nil, :keyword => nil)
      assert_equal expected, BetterDashCli::ArgumentParser.parse(args)
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
