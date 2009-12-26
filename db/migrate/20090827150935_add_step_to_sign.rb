class AddStepToSign < ActiveRecord::Migration
  def self.up
    add_column :signs, :step, :integer, :default=>'1'
  end

  def self.down
    remove_column :signs, :step
  end
end
