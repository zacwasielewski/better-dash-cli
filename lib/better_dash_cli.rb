require "better_dash_cli/version"

module BetterDashCli

  class CommandBuilder

    def self.command_from_options opts
      case opts.length
      when 0
        raise ArgumentError, "Wrong number of arguments (0 for 1..2)"
      when 1
        search = opts[0]
        cmd    = "dash://#{search}"  
      when 2
        lang   = opts[0]
        search = opts[1]
        cmd    = "dash://#{lang}:#{search}"
      else
        raise ArgumentError, "Wrong number of arguments (#{opts.length} for 1..2)"
      end
      cmd
    end

  end
  
end
