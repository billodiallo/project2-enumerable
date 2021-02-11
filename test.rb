module Enumerable
    # my_inject method
  def my_inject(init = self[0])
    result = init
    res = self
    res.my_each do |i|
      next if init == i

      result = yield(result, i)
    end
    result
  end
end

# multiply method
def multiply_els(par)
    par.my_inject(1) { |a, b| a * b }
  end

  puts 'my_inject Range'
 puts ((5..10).my_inject { |x, y| x + y })

# puts 'my_inject Array'
# [2, 2, 3, 2].my_inject { |x, y| x * y }

# puts 'multiply_els'
# multiply_els([2, 4, 5])
    
    
    




