# See exercise details here: https://launchschool.com/exercises/de341977
class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    @h_rule = '+'
    (@message.chars.size + 2).times { @h_rule << "-" }
    @h_rule << '+'
  end

  def empty_line
    @e_line = '|'
    (@message.chars.size + 2).times { @e_line << " " }
    @e_line << '|'
  end

  def message_line
    "| #{@message} |"
  end
end

# Test cases:
banner = Banner.new('To boldly go where no one has gone before.')
puts banner

