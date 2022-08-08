module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        kinopoisk_ratings =
          array.filter { |film| film['country'].split(',').length >= 2 if film['country'].present? }
               .map { |film| film['rating_kinopoisk'].to_f }
               .filter(&:positive?)
        rating_sum = kinopoisk_ratings.reduce(:+)
        rating_sum / kinopoisk_ratings.length
      end

      def chars_count(films, threshold)
        searchable_char = 'и'
        films.filter { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'] }
             .reduce(0) { |acc, name| acc + name.count(searchable_char) }
      end
    end
  end
end
