require "better_dash_cli/version"

module BetterDashCli

  class CommandBuilder

    def self.command_from_options opts
      case opts.length
      when 0
        raise "At least one argument is required."
      when 1
        search = opts[0]
        cmd    = "dash://#{search}"  
      when 2
        lang   = opts[0]
        search = opts[1]
        cmd    = "dash://#{lang}:#{search}"
      else
        raise "Too many arguments."
      end
      cmd
    end

  end
  
end
