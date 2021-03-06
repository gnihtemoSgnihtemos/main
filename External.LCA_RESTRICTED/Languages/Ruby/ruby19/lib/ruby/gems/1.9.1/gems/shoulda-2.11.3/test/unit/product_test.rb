require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  context "An intangible product" do
    subject { Product.new(:tangible => false) }

    should_validate_presence_of :title
    should_not_allow_values_for :size, "22"
    should_allow_values_for :size, "22kb"
    should_ensure_value_in_range :price, 0..99
  end

  context "A tangible product" do
    subject { Product.new(:tangible => true) }

    should_validate_presence_of :price
    should_ensure_value_in_range :price, 1..9999
    should_ensure_value_in_range :weight, 1..100
    should_not_allow_values_for :size, "22", "10x15"
    should_allow_values_for :size, "12x12x1"
    should_ensure_length_in_range :size, 5..20
  end
end
