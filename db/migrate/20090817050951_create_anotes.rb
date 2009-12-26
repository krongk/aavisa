class CreateAnotes < ActiveRecord::Migration
  def self.up
    create_table :anotes do |t|
      t.string :name
      t.string :tel
      t.string :phone
      t.date :birth,  :default=>'1980-1-1'
      t.string :email
      t.string :major
      t.string :school
      t.string :education
      t.string :degree
      t.text :question
      t.text :resume
      t.string :english_type
      t.string :english_record
      t.string :plan_level
      t.string :plan_major
      t.date :plan_date
      t.boolean :is_reply, :default=>'false'
      t.string :replyer
      t.text :answer
      t.boolean :is_display, :default=>'true'

      t.timestamps
    end
  end

  def self.down
    drop_table :anotes
  end
end
