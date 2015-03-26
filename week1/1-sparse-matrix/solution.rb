class Array
  def distances
    return [] if empty?
    indexes = map { |e| e[0] }
    first_index = indexes.first
    indexes.map { |value| value - first_index }
  end

  def compress
    matrix = map { |row| row.map.with_index { |e, i| [i, e] if e }.compact }

    matrix.each_with_object([]) do |row, result|
      distances = row.distances
      index = result.first_suitable_index(distances)
      row_enum = row.to_enum
      distances.each { |distance| result[index + distance] = row_enum.next }
      result
    end
  end

  def first_suitable_index(distances)
    empty_spaces = map.with_index { |elem, i| i unless elem }.compact

    index = empty_spaces.lazy.reject do |e|
      distances.map { |distance| self[e + distance] }.any?
    end.first

    index = length if index.nil?

    index
  end
end
