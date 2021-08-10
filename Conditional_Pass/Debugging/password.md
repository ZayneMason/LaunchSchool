
# Debugging steps for the exercise Password.
Exercise can be found here: https://launchschool.com/exercises/23afd966

This file was designed to be used as an explanation of the code in the file password.rb, located in the same folder as this one.

This debugging exercise asks the following:

The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password. However, the program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected? Verify that you are able to log in with your new password.

```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password
```

# My solution explanation.
Initially running the code we get to the step of logging in, however, when we try to input
our password we get:
```
Traceback (most recent call last):
        1: from password.rb:26:in `<main>'
password.rb:15:in `verify_password': undefined local variable or method `password' for main:Object (NameError)
```
