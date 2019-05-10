
class ArgumentParser
  attr_reader :command, :parameters, :target

  def initialize(command_string)
    chunks = command_string.split
    @command = chunks[0]
    @parameters = chunks.slice(1, chunks.length)

    last_entry = chunks.last
    if !last_entry.start_with? "-"
      @target = last_entry
    else
      @target = nil
    end
  end
end

