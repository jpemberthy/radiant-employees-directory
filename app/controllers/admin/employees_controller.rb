class Admin::EmployeesController < Admin::ResourceController 
  
  def index
    @employees = Employee.find(:all, :order => "show_order ASC")
  end
  
  
  def toggle_order 
    @employee = Employee.find(params[:id])
    @switched = @employee.switched_from(params[:order])
    @employee.toggle_order(params[:order])
    
    respond_to do |format|
      format.js 
      format.html { redirect_to :back }
    end
  end
  
end
