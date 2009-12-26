class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.references :project
      t.integer :typo,				:default=>0
      t.string :title
      t.string :stitle
      t.string :title_style
      t.string :author
      t.string :source
      t.string :tags
      t.string :property,			:default=>"0,0,0,0,0,0,0,0"
      t.text :info
      t.string :metakeywords, :default=>"亚美经济文化"
      t.string :metadesc,			:default=>"亚美经济文化"
      t.boolean :is_use_templet, :default=>'false'
      t.string :templet
      t.boolean :is_image,		:default=>'false'
      t.integer :image_id
      t.string :image_url
      t.integer :visit_count, :default=>0
      t.integer :digg_count,	:default=>0
      t.boolean :is_comment,	:default=>'false'
      t.boolean :is_lock,			:default=>'false'
      t.boolean :is_recyle,		:default=>'false'
      t.boolean :is_html,			:default=>'false'
      t.string :file_path
      t.boolean :is_vote,			:default=>'false'
      t.boolean :is_display,	:default=>'true'
      t.boolean :is_list_top, :default=>'false'
      t.integer :sort_id,			:default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
