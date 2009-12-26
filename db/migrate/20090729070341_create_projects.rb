class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :parent_id,	:default=>0
      t.string :cn_name
      t.string :en_name
      t.string :url
      t.boolean :is_leaf,	  :default=>'true'
      t.boolean :is_display,:default=>'true'
      t.integer :sort_id,   :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
