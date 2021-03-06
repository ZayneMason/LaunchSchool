require 'erb'
require_relative 'advice'

class App
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', {"Content-Type" => 'text/html'}, [erb(:index)]]
    when '/advice'
      advice_message = Advice.new.generate
      ['200', {"Content-Type" => 'text/html'}, [erb(:advice, message: advice_message)]]
    else
      ['404', {"Content-Type" => 'text/html', "Content-Length" => '60'}, [erb(:not_found)]]
    end
  end

  private

  def erb(filename, local = {})
    b = binding
    message = local[:message]
    content = File.read("views/#{filename}.erb")
    ERB.new(content).result(b)
  end
end