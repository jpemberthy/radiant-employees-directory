require File.dirname(__FILE__) + '/../spec_helper'

describe Employee do
  before(:each) do
    @employee = Employee.new
  end

  it "should be valid" do
    @employee.should be_valid
  end
end
