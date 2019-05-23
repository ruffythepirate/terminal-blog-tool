require_relative("command_definition")

require("httparty")

class CommandFactory
  def initialize(config)
    @config = config
  end

  def create_command(command_definition)
    loginCommand = LoginCommand.new(@config)
    loginCommand.execute

    case command_defintion.command
    when "ls"
      LsCommand.new(@config, command_definition)
    else
      nil
    end
  end
end

class LoginCommand
  def initialize(config)
    @config = config
  end

  def execute
    relative_url = "login"

    puts "Please enter password for username #{@config["username"]}: "
    password = STDIN.gets

    response = HTTParty.post(@config["base_url"] + relative_url, body: {
      session: {
        email: @config["username"],
        password: password
      }
    })

    puts "Response status code: #{response.code}"

  end
end

class LsCommand
  def initialize(config, command_definition)
    @config = config
    @command_definition = command_definition
  end

  def execute
    relative_url = "api/user/post-list"
    response = HTTParty.get(config.base_url + relative_url)

    p response.body
  end
end
