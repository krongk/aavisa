class CreateGnotes < ActiveRecord::Migration
  def self.up
    create_table :gnotes do |t|
      t.string :name
      t.string :tel
      t.string :phone
      t.date :birth,  :defalt=>'1980-1-1'
      t.string :email
      t.text :question
      t.boolean :is_reply,  :default=>'false'
      t.string :replyer,  :default=>'admin'
      t.text :answer
      t.boolean :is_display,:default=>'false'

      t.timestamps
    end
  end

  def self.down
    drop_table :gnotes
  end
end
