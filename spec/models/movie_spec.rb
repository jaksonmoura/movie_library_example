require File.dirname(__FILE__) + '/../spec_helper'

describe Movie do
  it "should be valid" do
    Movie.new.should be_valid
  end
end
