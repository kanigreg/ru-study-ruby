module Exercise
  module Arrays
    class << self
      def max(array)
        return nil if array.empty?

        iter = array.each
        max = iter.next
        for i in iter
          max = i if i > max
        end
        max
      end

      def replace(array)
        retrun [] if array.empty?

        max = max(array)
        array.map{ |item| item > 0 ? max : item }
      end

      def search(array, query)
        search_helper = ->(left, right) do
          return -1 if left > right

          middle = (left+right) / 2
          if array[middle] == query
            middle
          elsif query > array[middle]
            search_helper.call(middle + 1, right)
          else
            search_helper.call(left, middle - 1)
          end
        end
        search_helper.call(0, array.length - 1)
      end
    end
  end
end
