# See excercise, that's a lot of typing.

def initialize_lights(number_of_lights)
  lights = {}
  1.upto(number_of_lights) { |number| lights[number] = "0" }
  lights
end

def on_lights(lights)
  lights.select { |_position, state| state == "1" }.keys
end

def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "0") ? "1" : "0"
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)