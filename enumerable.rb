module Enumerable
    def my_each
      return to_enum(:my_each) unless block_given?
  
      i = 0
      while i < to_a.length
        yield to_a[i]
        i += 1
      end
      self
    end

    def my_each_with_index
        return to_enum(:my_each_with_index) unless block_given?
    
        i = 0
        while i < to_a.length
            yield([to_a[i], i])
          i += 1
        end
        self
      end

    #   my select_enumerable
    def my_select
        return to_enum(:my_select) unless block_given?
    
        new_arr = []
        self.my_each { |item| new_arr << item if yield (item) }
         new_arr
      end
       #   my select_enumerable-code

    #    my_all code
    def my_all?(param = nil)
        if block_given?
          to_a.my_each { |item| return false if yield(item) == false }
          return true
        elsif param.nil?
          to_a.my_each { |item| return false if item.nil? || item == false }
        elsif !param.nil? && (param.is_a? Class)
          to_a.my_each { |item| return false unless [item.class, item.class.superclass].include?(param) }
        elsif !param.nil? && param.instance_of?(Regexp)
          to_a.my_each { |item| return false unless param.match(item) }
        else
          to_a.my_each { |item| return false if item != param }
        end
        true
      end

    # my_all code
    def my_all?(param = nil)
        if block_given?
          to_a.my_each { |item| return false if yield(item) == false }
          return true
        elsif param.nil?
          to_a.my_each { |item| return false if item.nil? || item == false }
        elsif !param.nil? && (param.is_a? Class)
          to_a.my_each { |item| return false unless [item.class, item.class.superclass].include?(param) }
        elsif !param.nil? && param.instance_of?(Regexp)
          to_a.my_each { |item| return false unless param.match(item) }
        else
          to_a.my_each { |item| return false if item != param }
        end
        true
      end

    # my_all

    # my_any start
    def my_any?(param = nil)
        if block_given?
          to_a.my_each { |item| return true if yield(item) }
          return false
        elsif param.nil?
          to_a.my_each { |item| return true if item }
        elsif !param.nil? && (param.is_a? Class)
          to_a.my_each { |item| return true if [item.class, item.class.superclass].include?(param) }
        elsif !param.nil? && param.instance_of?(Regexp)
          to_a.my_each { |item| return true if param.match(item) }
        else
          to_a.my_each { |item| return true if item == param }
        end
        false
      end

    # my any_end

    # my_none code 
    def my_none?(param = nil)
        if block_given?
          !my_any?(&Proc.new)
        else
          !my_any?(param)
        end
      end
    # my_none code end

    # my_count
    def my_count(param = nil)
        c = 0
        if block_given?
          to_a.my_each { |item| c += 1 if yield(item) }
        elsif !block_given? && param.nil?
          c = to_a.length
        else
          c = to_a.my_select { |item| item == param }.length
        end
        c
      end
    # my_count

    # my_map
    def my_map(proc_x = nil)
        return enum_for unless block_given?
    
        map_list = []
        if proc_x.nil?
          my_each { |element| map_list.push(yield(element)) }
        else
          my_each { |element| map_list.push(proc_x.call(element)) }
        end
        map_list
      end
    # my_map 

    # my_inject code 
    
   

    # my_inject code

  end


# section for testing the enumerable
# puts 'my_each array'
# [2, 5, 6, 7].my_each do |i|
#   puts i
# end

# puts 'my_each Range'
# (3..11).my_each do |n|
#   puts n
# end

# puts 'my_each_with_index'
# bc = [1,3,5,8,4]
# bc.my_each_with_index do |n, i|
#   puts i.to_s + ': ' + n.to_s
# end

# puts 'my_select'
# arr = [2, 5, 6, 7]
# c = arr.my_select do |n|
#     n > 5
# end
# puts c


# puts 'my_all'
# w = [2, 4, 6, 7, 8, 4]
# q = w.my_all? do |n|
#   n < 9
# end
# puts q


# puts 'my_any'
# q = [4, 5, 6]
# a = (q.my_any? { |n| n < 3 })
# puts a

# puts 'my_none'
# as = [4, 5, 6]
# z = (as.my_none? { |n| n > 3 })
# puts z

# puts 'my_count Array'
# puts [2, 3, 56, 6, 3, 2, 9, 1, 2, 3, 3, 5].my_count(3)

# puts 'my_count Range'
# puts (0..5).my_count(2)

# puts 'my_map Range'
# puts ((0..5).my_map { |i| i * i })



# End section for testing the enumerable
