class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :title
      t.boolean   :management
      t.text      :profile
      t.text      :extended_profile
      t.string    :email
      t.integer   :show_order

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
