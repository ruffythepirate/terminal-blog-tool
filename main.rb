require_relative("commands/command_definition")
require_relative("commands/command_factory")

def read_configuration
  home_directory = "/home/#{ENV['USERNAME']}"
  config_relative_path="/.config/blog/"
  config_dir_exists = File.directory?(home_directory + config_relative_path)

  if config_dir_exists
    config_file_name='config'
    read_configuration_file(home_directory + config_relative_path + config_file_name)
  else
    {}
  end
end

def read_configuration_file(config_path)
  f=File.open(config_path)
  settings = {}
  begin
    f.each_line { |l|
      stripped = l.strip
      if !stripped.start_with?("#") && !stripped.empty?
        chunks = stripped.split("=")
        settings[chunks[0]] = chunks[1]
      end
    }
  ensure
    f.close
  end
  settings
end

config = read_configuration
p config
command_string=ARGV.join(" ")
command_definition = CommandDefinition.new(command_string)

p command_definition

command_factory = CommandFactory.new(config)

command_factory.create_command(command_definition)



