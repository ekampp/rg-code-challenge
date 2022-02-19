# frozen_string_literal: true

class Node
  OPERATIONS = {
    "x" => "*",
    "÷" => "/",
    "+" => "+",
    "-" => "-",
  }.freeze

  def initialize(*args, operator: nil, value: nil, left: nil, right: nil)
    # Preserve backwards compatibility with original, positional signature
    orig_operator, orig_value, orig_left, orig_right, *_ = *args

    @operator = (operator || orig_operator).to_s
    @value = value || orig_value
    @left = left || orig_left
    @right = right || orig_right

    validate_arguments!
  end

  def result
    return value.to_f if operator.empty?

    instance_eval "#{left.result} #{OPERATIONS[operator]} #{right.result}", __FILE__, __LINE__ # 2 * 8
  end

  def to_s
    return value.to_s if operator.empty?

    "(#{left} #{operator} #{right})"
  end

  private

    attr_reader :operator, :value, :left, :right

    def validate_arguments!
      validate_right_argument!
      validate_left_argument!
      validate_operator!
      validate_value!
    end

    def validate_right_argument!
      raise ArgumentError, "right argument must be a Node instance" if right && !right.is_a?(Node)
    end

    def validate_left_argument!
      raise ArgumentError, "left argument must be a Node instance" if left && !left.is_a?(Node)
    end

    def validate_operator!
      raise ArgumentError, "operator must be one of x, ÷, +, -" if !operator.empty? && !OPERATIONS[operator]
    end

    def validate_value!
      raise ArgumentError, "value must be coercible to a number" if value && !value.respond_to?(:to_f)
    end
end
