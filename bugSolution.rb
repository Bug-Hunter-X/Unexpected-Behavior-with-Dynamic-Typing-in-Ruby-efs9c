```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def value
    @value
  end

  def value=(new_value)
    # Type checking to prevent unexpected behavior
    unless new_value.is_a?(Integer)
      raise TypeError, "Value must be an Integer"
    end
    @value = new_value
  end
end

my_object = MyClass.new(10)
puts my_object.value #=> 10
my_object.value = 20
puts my_object.value #=> 20

# Now this will raise a TypeError
begin
  my_object.value = 'hello'
rescue TypeError => e
  puts e.message #=> "Value must be an Integer"
end

#Alternatively, use strong typing with a library like dry-types
# gem install dry-types

require 'dry-types'

Types = Dry::Types()

class MyClass
  include Dry::Monads[:result]

  def initialize(value)
      @value = value
  end

  def value
      @value
  end

  def value=(new_value)
      result = Types::Integer.try(new_value)
      result.success? ? @value = result.value : raise(TypeError, "Value must be an Integer")
  end
end
```