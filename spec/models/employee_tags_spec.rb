require File.dirname(__FILE__) + '/../spec_helper'

describe EmployeeTags do
  dataset :pages
  
  before(:each) do
    brian = Employee.new(:title => "President", :first_name => "Brian", :last_name => "S")
    brian.save!
  end
  
  describe "employees:managers:full_profile" do
    tag = "<r:employees:managers> <r:full_profile /> </r:employees:managers>"
    
    expected = %{<span class="bold"> #{Brian S}.</span> <em> #{President} </em> <br/>}
    
    pages(:home).should render(:tag).as(:expected)
    
  end
  
end