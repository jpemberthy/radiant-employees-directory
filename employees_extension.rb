# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class EmployeesExtension < Radiant::Extension
  version "1.0"
  description "employees-directory manager"
  url "http://github.com/jpemberthy/radiant-employees-directory"
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get, :toggle_order => :post } do |admin|
      admin.resources :employees
    end
    
    map.connect 'employees/:name', :controller => 'employees', :action => 'show', :requirements => { :name => /employee([-a-zA-Z0-9]+)/ }
  end
  
  def activate
    admin.tabs.add "Employees", "/admin/employees", :after => "Layouts", :visibility => [:all]
    Page.send :include, EmployeeTags
    PageAttachment.send :belongs_to, :employee
  end
  
  def deactivate
    # admin.tabs.remove "Employees"
  end
  
end
