module EmployeeTags
  include Radiant::Taggable
  
  tag 'employee' do |tag|
    tag.expand
  end
    
  %w(kind title first_name name profile extended_profile profile_thumbnail_filename).each do |type|
    desc %{
      Renders a the employee #{type} attribute..}
    tag "employee:#{type}" do |tag|
      tag.locals.send(type, @employee.send(type.to_sym))
    end
  end
  
  # tag 'employee:type' do |tag|
  #   tag.locals.type  = @employee.interventionist? ? "Interventionists" : "Management Team"
  # end

  tag 'employees' do |tag|
    tag.expand
  end
  
  tag 'employees:collection' do |tag|
    result = []
    collection = tag.attr['employee_type'] == "managers" ? Employee.managers : Employee.interventionists
    collection = collection.find(:all, :order => tag.attr['order']) if tag.attr['order']
    
    if tag.attr['container'] == "table"
      collection.each_slice(4) do |row|
        result << "<tr>"
        for employee in row
          tag.locals.employee = employee  
          result << tag.expand
        end
        result << "</tr>"
      end
    else
      collection.each do |employee|
        tag.locals.employee = employee
        result << tag.expand
      end
    end
      
    result
  end
  
  tag 'employees:collection:face_profile' do |tag|
    employee = tag.locals.employee
    %{<td valign="top" align="center"><p> <a href="#{employee.detailed_profile}"> <img alt=" #{employee.first_name}" src=" #{employee.profile_face.try(:public_filename)}" /></a><br/> <span class="name"> #{employee.name} </span> <br/> <span class="title"><em> #{employee.title} </em></span></p></td>}
  end
  
  tag 'employees:collection:name_link' do |tag|
    employee = tag.locals.employee
    %{<li><a href="#{employee.detailed_profile}">#{employee.name}</a></li>}
  end
  
  tag 'employees:collection:full_profile' do |tag|
    employee = tag.locals.employee
    %{<p><span class="bold"> #{employee.name}.</span> <em> #{employee.title} </em> <br/>
    <img alt="#{employee.first_name}" src="#{employee.profile_thumbnail.try(:public_filename)}"/> #{employee.extended_profile}.</p>}
  end
  
end