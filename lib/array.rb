class Array
  # Flattens a nested array of mixed items
  def flatten
    flat_array = []

    each do |item|
      case item
      when Array then flat_array.concat item.flatten
      when Hash then flat_array.concat item.values.flatten
      else flat_array << item
      end
    end

    flat_array
  end
end
