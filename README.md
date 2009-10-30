Employees
===

About
---

A [Radiant][rd] Extension by [Martian interactive][mi] that adds employees management. Employees have name, email, profile, extended profile and more fields.

Installation
---

Before you install `employees` ensure you already have installed [page_attachments][pa] 

After installing `page_attachments`.

	cd /path/to/radiant
	git clone git://github.com/jpemberthy/radiant-employees.git vendor/extensions/employees
	rake radiant:extensions:employees:migrate
	rake radiant:extensions:employees:update
	
Don't have `git`? Download the [tarball][ta]

Restart your server, and there will be a new tab called "employees" in the admin interface

Managing Employees
---


Usage
---

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
