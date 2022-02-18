require "spec_helper"
require_relative "../lib/array"

RSpec.describe "Array#flatten" do
  subject(:flatten) { array.flatten }

  describe "nested array if integers" do
    let(:array) { [ 1, [ 2, [ 3 ] ], 4 ] }

    # Original happy-path test from the assignment
    it { is_expected.to eql [1, 2, 3, 4] }
  end

  describe "nested array contains strings" do
    let(:array) { [ 1, [ 2, [ "a" ] ], 4 ] }

    it { is_expected.to eql [1, 2, "a", 4] }
  end

  describe "nested array contains hash" do
    let(:array) { [ 1, [ 2, [ { a: 3 } ] ], 4 ] }

    it { is_expected.to eql [1, 2, 3, 4] }
  end

  describe "non-arrays" do
    let(:array) { "hello" }

    it "doesn't work on non-arrays because we extend the primitive Array" do
      expect { flatten }.to raise_error NoMethodError, /undefined method/
    end
  end
end
