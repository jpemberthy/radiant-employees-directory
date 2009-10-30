class PageAddEmployeesTemplate < ActiveRecord::Migration
  def self.up
    name = "employee_template"
    root = Page.find(:first, :conditions => { :slug => '/' })
    page = Page.new(:title => name, :slug => name, :breadcrumb => name, :status_id => 100, :parent => root)
    if page.save!
      PagePart.create(:name => "body", :page => page,  :content => "<h2 class=\"employees\"><r:employee:kind /></h2>\r\n<p><span class=\"bold\"><r:employee:name />.</span> <em><r:employee:title /></em> <br/>\r\n<img alt=\"<r:employee:first_name />\" src=\"<r:employee:profile_thumbnail_filename />\" />\r\n<r:employee:extended_profile />")
    end 
  end
  
  def self.down
    root = Page.find(:first, :conditions => { :slug => '/' })
    root.children.find(:first, :conditions => { :slug => "employee_template" }).destroy
  end
  
end