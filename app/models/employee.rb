class Employee < ActiveRecord::Base
  has_many :page_attachments
  after_create :set_order
  named_scope :managers, :conditions => { :management => true }, :order => 'show_order ASC'
  named_scope :regulars, :conditions => { :management => false }, :order => 'show_order ASC'
  
  accepts_nested_attributes_for :page_attachments, :allow_destroy => true
  
  def name
    first_name + " " + last_name
  end
  
  def profile_picture
    self.page_attachments.find(:first, :conditions => {:description => "profile"})
  end
  
  def profile_thumbnail
    profile_picture.thumbnails.find_by_thumbnail('thumb') if profile_picture
  end
  
  def profile_icon
    profile_picture.thumbnails.find_by_thumbnail('icon') if profile_picture
  end
  
  def profile_face
    profile_picture.thumbnails.find_by_thumbnail('face') if profile_picture
  end
  
  def detailed_profile
    "/employees/employee-#{first_name}-#{last_name}"
  end
  
  def profile_thumbnail_filename
    profile_thumbnail.public_filename
  end
  
  def kind
    self.interventionist? ? "Interventionists" : "Management Team"
  end
  
  def interventionist?
    !management
  end
  
  def toggle_order(order)
    switched = closest_employee(order)
    unless switched.new_record?
      switched_order = switched.show_order
      switched.update_attribute(:show_order, self.show_order)
      self.update_attribute(:show_order, switched_order)
    end
  end
  
  def closest_employee(side)
    closest = Employee.new
    case side
    when "up"
      Employee.find(:all, :order => "show_order ASC").each { |e| e == self ? break : closest = e }
    when "down"
      Employee.find(:all, :order => "show_order DESC").each { |e| e == self ? break : closest = e }
    end
    closest
  end
  
  def switched_from(side)
    closest = closest_employee(side)
    closest.new_record? ? self : closest
  end
  
  protected
  
  def set_order
    update_attribute(:show_order, id)
  end
  
end
