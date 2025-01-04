```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def value
    @value
  end

  def value=(new_value)
    @value = new_value
  end
end

my_object = MyClass.new(10)
puts my_object.value #=> 10
my_object.value = 20
puts my_object.value #=> 20

# Unexpected behavior:
my_object.value = 'hello'
puts my_object.value #=> "hello"

# The issue here is that Ruby allows dynamic typing, which means that you can assign a string to a variable that was previously holding an integer without any errors.
# This can lead to unexpected behavior if you are not careful.
```