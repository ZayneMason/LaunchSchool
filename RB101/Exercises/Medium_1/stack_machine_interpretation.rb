# A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an
# array that just uses #push and #pop methods.
# Write a method that implements a miniature stack-and-register-based programming language with the following commands:
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division
# in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# Programs will be supplied to your language method via a string passed in as an argument. 
# You may assume all programs are correct programs. You should initialize the register to 0.

def interpret(str)
  stack = []
  commands = str.split
  register = 0

  until commands.empty?
    command = commands.shift

    case command
    when /[0-9]/
      register = command.to_i
    when 'PUSH'
      stack.push(register)
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    when 'ADD'
      stack.empty? ? register : register += stack.pop
    when 'SUB'
      stack.empty? ? register : register -= stack.pop
    when 'MULT'
      stack.empty? ? register : register *= stack.pop
    when 'DIV'
      stack.empty? ? register : register /= stack.pop
    when 'POWER'
      stack.empty? ? register : register **= stack.pop
    when 'MOD'
      stack.empty? ? register : register = register.divmod(stack.pop)
    end
  end
end

# Tests:
interpret('5 PUSH 3 POWER PRINT')
interpret('10 PUSH 5 SUB PRINT')
interpret('5 PUSH 10 MULT PUSH 7 SUB PUSH 10 ADD PRINT')
