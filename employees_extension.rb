# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class EmployeesExtension < Radiant::Extension
  version "1.0"
  description "Employees manager"
  url "http://yourwebsite.com/employees"
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get, :toggle_order => :post } do |admin|
      admin.resources :employees
    end
    
    map.connect 'employees/:name', :controller => 'employees', :action => 'show', :requirements => { :name => /employee([-a-z0-9]+)/ }
  end
  
  def activate
    admin.tabs.add "Employees", "/admin/employees", :after => "Layouts", :visibility => [:all]
    Page.send :include, EmployeeTags
  end
  
  def deactivate
    # admin.tabs.remove "Employees"
  end
  
end
