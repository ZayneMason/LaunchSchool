# Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error.
# Create a better_grade_than? method, that you can call like so...
# puts "Well done!" if joe.better_grade_than?(bob)

class Student
  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(other)
    @grade > other.get_grade
  end
  
  protected

  def get_grade
    @grade
  end
end

jimmy = Student.new("Jimmy", 99)
fred = Student.new("Fred", 95)
puts "Well done!" if jimmy.better_grade_than?(fred)
