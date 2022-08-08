module Exercise
  module Arrays
    class << self
      def max(array)
        return nil if array.empty?

        max = array.first
        array.drop(1).each { |item| max = item if item > max }
        max
      end

      def replace(array)
        retrun [] if array.empty?

        max = max(array)
        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right

        middle = (left + right) / 2

        return middle if array[middle] == query

        if query > array[middle]
          search(array, query, middle + 1, right)
        else
          search(array, query, left, middle - 1)
        end
      end
    end
  end
end
