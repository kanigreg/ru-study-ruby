module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self
          yield item
        end
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(MyArray.new) { |acc, item| acc << block.call(item)  }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, item| item.nil? ? acc : acc << item }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        my_each { |item| acc = acc.nil? ? item : block.call(acc, item) }
        acc
      end
    end
  end
end
