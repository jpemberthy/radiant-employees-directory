class EmployeesController < SiteController
  # radiant_layout 'your_site_layout' #put here your public layout name.
  no_login_required
  
  Page.send :attr_accessor, :employee
  
  def show
    req, first_name, last_name = params[:name].split("-")
    @employee = Employee.first(:conditions => ["first_name = :first_name AND last_name = :last_name", {:first_name => first_name, :last_name => last_name}])
    if @employee
      @page = find_page('employee_template')
      @page.employee = @employee
      process_page(@page)
      set_cache_control
      @performed_render ||= true
    else
      render :template => 'site/not_found', :status => 404
    end
  end
  
end
