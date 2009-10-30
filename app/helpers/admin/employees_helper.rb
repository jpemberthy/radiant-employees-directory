module Admin::EmployeesHelper
    def setup_page_attachment_for(employee)
      employee.page_attachments.build if employee.page_attachments.empty?
  	end  
end
