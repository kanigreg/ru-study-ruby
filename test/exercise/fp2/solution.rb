module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(current_index = 0, &block)
        return self if current_index >= length || current_index.negative?

        block.call(self[current_index])

        my_each(current_index + 1, &block)
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
      def my_reduce(acc = nil, current_index = 0, &block)
        return acc if current_index >= length || current_index.negative?

        return my_reduce(self[current_index], current_index + 1, &block) if acc.nil?

        acc = block.call(acc, self[current_index])
        my_reduce(acc, current_index + 1, &block)
      end
    end
  end
end
