class PageAttachmentsAddEmployeeId < ActiveRecord::Migration
  def self.up
    add_column :page_attachments, :employee_id, :integer
  end

  def self.down
    remove_column :page_attachments, :employee_id
  end
end
