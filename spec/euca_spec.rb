require 'support/minitest_helper'
require 'euca'

describe Euca do
  it "knows all available euca commands" do
    Euca.api_methods.must_be_kind_of Array
    Euca.api_methods.size.must_equal 64
  end
end
