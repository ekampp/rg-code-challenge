class Node
  OPERATIONS = {
    "x" => "*",
    "÷" => "/",
    "+" => "+",
    "-" => "-",
  }

  def initialize(operator: "", value: 0.0, left: nil, right: nil)
    raise ArgumentError, "right argument must be a Node instance" if right && !right.is_a?(Node)
    raise ArgumentError, "left argument must be a Node instance" if left && !left.is_a?(Node)
    raise ArgumentError, "operator must be one of x, ÷, +, -" if !operator.empty? && !OPERATIONS[operator]
    raise ArgumentError, "value must be coercible to a number" if value && !value.respond_to?(:to_f)

    @operator = operator
    @value = value
    @left = left
    @right = right
  end

  def result
    return value.to_f if operator.empty?

    instance_eval "#{left.result} #{OPERATIONS[operator]} #{right.result}"
  end

  def to_s
    return value.to_s if operator.empty?

    "(#{left} #{operator} #{right})"
  end

  private

    attr_reader :operator, :value, :left, :right
end
