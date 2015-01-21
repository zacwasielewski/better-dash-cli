require "ostruct"
require "better_dash_cli/version"

module BetterDashCli
  
  class ArgumentParser
    
    def self.parse(args)
      
      options = OpenStruct.new
      options.language = nil
      options.keyword  = nil
      
      case args.length
      when 0
        raise ArgumentError, "Wrong number of arguments (0 for 1..2)"
      when 1
        options.keyword  = args[0]
      when 2
        options.language = args[0]
        options.keyword  = args[1]
      else
        raise ArgumentError, "Wrong number of arguments (#{args.length} for 1..2)"
      end
      
      options
    end
    
  end
  
  class Dash
    
    @language = nil
    @keyword  = nil
    
    def initialize(args)
      options = ArgumentParser.parse(args)
      @language = options.language
      @keyword  = options.keyword
    end
    
    def command
      raise Exception if @keyword.nil?
      if !@language.nil?
        command = "dash://#{@language}:#{@keyword}"
      else
        command = "dash://#{@keyword}"
      end
      command
    end
    
  end
  
end
