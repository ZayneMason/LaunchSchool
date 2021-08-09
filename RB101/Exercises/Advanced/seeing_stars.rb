# Write a method that diaplays an 8-pointed star in an n x n grid, where n is an odd integer supplied as a method argument
# The smallest such star you need to handle is a 7 x 7 grid.

# Problem:
# -- input: odd integer >= 7
# -- output: integer x integer grid in the form of an 8- sided star, think astrics with a line through it.
# Example: 
##############
# star(9) =>
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
##############
# From example: 
# -- we will use '*' to output parts of the star, we will use spaces to define the space
# -- we will need to figure out spacing of the multiple '*'
# -- star will use 3 '*' for each grid layer other than the center to achieve 8 points
# Data structure:
# -- hash with each key being a line slot
# Algo:
# -- set hash with keys being int - 1
# -- intialize value for each being ' '
# -- set values for 1, ((int - 1) /2 ), and int keys to '*'
# -- iterate over hash until center key is ' ' changing the value of 1 and 9 to ' ' and incrementing the key we change down and up respectively by 1
# -- repeat until we reach center, at which point we can output a line of int stars
# -- reverse the process for bottom half, start with center - 1, center, center + 1
def line_out(hash, int)
  line = ''
  int.times { |key| line << hash[key]}
  puts line
end

def fresh_hash(hash, int)
  int.times { |key| hash[key] = ' '}
  hash[int / 2] = '*'
end

def star(int)
  line_hsh = Hash.new
  fresh_hash(line_hsh, int)

  iteration = 0
  until line_hsh[(int / 2)] == ' ' do
    line_hsh[(int - 1) - iteration] = '*'
    line_hsh[0 + iteration] = '*'
    line_out(line_hsh, int)
    break if line_hsh[(int / 2) + 1] == '*'
    
    line_hsh[(int - 1) - iteration] = ' '
    line_hsh[0 + iteration] = ' '
    iteration += 1
  end
  
  int.times { |key| line_hsh[key] = '*'}
  line_out(line_hsh, int)
  fresh_hash(line_hsh, int)
  
  iteration = 1
  until line_hsh[(int / 2)] == ' ' do
    line_hsh[(int / 2) + iteration] = '*'
    line_hsh[(int / 2) - iteration] = '*'
    line_out(line_hsh, int)
    break if line_hsh[0] == '*'

    line_hsh[(int / 2) + iteration] = ' '
    line_hsh[(int / 2) - iteration] = ' '
    iteration += 1
  end
end

star(13)
