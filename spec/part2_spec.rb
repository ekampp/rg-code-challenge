require "spec_helper"
require_relative "../lib/node"

RSpec.describe "Node" do
  subject(:tree) do
    Node.new(
      operator: "÷",
      left: Node.new(
        operator: "+",
        left: Node.new(value: 7),
        right: Node.new(
          operator: "x",
          left: Node.new(
            operator: "-",
            left: Node.new(value: 3),
            right: Node.new(value: 2),
          ),
          right: Node.new(value: 5)
        )
      ),
      right: Node.new(value: 6)
    );
  end

  # Original happy path tests from the assignment
  its(:to_s) { is_expected.to eql "((7 + ((3 - 2) x 5)) ÷ 6)" }
  its(:result) { is_expected.to eq 2 }

  describe 'invalid arguments' do
    subject(:tree) { Node.new(operator: operator, value: value, left: left, right: right) }
    let(:right) { Node.new(value: 0) }
    let(:left) { Node.new(value: 1) }
    let(:value) { nil }
    let(:operator) { "+" }

    context 'with coercible value' do
      let(:value) { "0" }
      its(:result) { is_expected.to eql 1.0 }
      its(:to_s) { is_expected.to eql "(1 + 0)" }
    end

    context 'with non-coercible value' do
      let(:value) { [1, 2] }

      it { expect { tree }.to raise_error ArgumentError, "value must be coercible to a number" }
    end

    context 'when right is not a Node instance' do
      let(:right) { [1, 2] }

      it { expect { tree }.to raise_error ArgumentError, "right argument must be a Node instance" }
    end

    context 'when left is not a Node instance' do
      let(:left) { [1, 2] }

      it { expect { tree }.to raise_error ArgumentError, "left argument must be a Node instance" }
    end

    context 'when operator is invalid' do
      let(:operator) { "h" }

      it { expect { tree }.to raise_error ArgumentError, "operator must be one of x, ÷, +, -"}
    end
  end
end
