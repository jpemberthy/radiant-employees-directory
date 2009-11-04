Employees
===

About
---

A [Radiant][rd] Extension by [Martian interactive][mi] that adds employees management. Employees have name, email, profile, extended profile and more fields.

Installation
---

Before you install `employees` ensure you already have installed the following extensions: [page_attachments][pa] and [share_layouts][sl]

After installing the `page_attachments` extension, you should configure it  to properly work with the `employees` extension (basically it's about the icon and thumbnail features), [this][th] is an example of how your `page_attachments.rb` file should look like. Now that you have a valid `page_attachments` setup you can install the `employees` extension:

	cd /path/to/radiant
	git clone git://github.com/jpemberthy/radiant-employees.git vendor/extensions/employees
	rake radiant:extensions:employees:migrate
	rake radiant:extensions:employees:update
	
Don't have `git`? Download the [tarball][ta]

Restart your server, and there will be a new tab called "employees" in the admin interface, and a new page "employee_template"

Managing Employees
---

From the new tab "employees" under admin, you will be able to create and update employees, by default when you are rendering a collection of employees they are ordered by the `show_order` attribute, but you can override this by using the defaults Radius tags, that will be described later.

The extension has a controller to render dinamically an employee from the public side, the convention is to use this path: `/employees/employee-first_name-last_name` and the contents will be render based in the `employees_template`, You can specify the layout you wish to show with the employee information, to do that, please edit this line in the non-admin employees_controller:

	radiant_layout 'your_site_layout' #put here your public layout name.
	
To set a profile image for an employee, please upload it as attachment from the admin section and set the description name as: `profile`. This image will be resized to be used as icon, thumbnail and profile_image.

Usage
---

The employees collection tag, options:

* `container` either "table" or "list". 
* `order` by default is set to "show_order", but you could use, "first_name", "last_name" ...
* `employee_type` either "regular" or "manager", by default is set to "regular".

Examples:

	Renders a short description of the employees using a thumbnail. 
	
	<table class="employees">
	    <tbody> 
	      <r:employees:collection container="table">
	        <r:face_profile /> 
	     </r:employees:collection>
	    </tbody>
	 </table>
	
	Renders a list of named based links that redirects to the individual employee view.
	
	<ul class="employees">
	  <r:employees:collection container="list" order="first_name" employee_type="managers">
	    <r:name_link />
	  </r:employees:collection>
	</ul>

You can find these tags inside the `employee_tags.rb` file, you can easily edit or create new employee_tags according to your needs.

Contributors
---

These people have contributed patches that have been added to the extension:

* [Sergio Bayona][sb]
* [Juan Esteban Pemberthy][jp]

[rd]: http://radiantcms.org/
[mi]: http://www.martianinteractive.com/
[pa]: http://github.com/radiant/radiant-page-attachments-extension
[ta]: http://github.com/jpemberthy/radiant-employees/tarball/master
[sb]: http://sergiobayona.com/
[jp]: http://jpemberthy.github.com/
[th]: https://gist.github.com/f4f7c6b6b352404d30a5
[sl]: http://github.com/radiant/radiant-share-layouts-extension

Todo
---
Live Demo.
Tests.
