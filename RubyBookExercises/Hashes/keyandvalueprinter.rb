#Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. 
#Then write a program that does the same thing except printing the values. Finally, write a program that prints both.

h1 = {
  :name => "Mr. Swag",
  :city => "Gootersville",
  :occupation => "Real G"
}
h1.each_key {|k| puts k}
h1.each_value {|v| puts v}
h1.each {|k , v| puts "#{k}: #{v}"}

