class CreateSigns < ActiveRecord::Migration
  def self.up
    create_table :signs do |t|
      t.integer :user_id
      t.boolean :is_contract
      t.string :record_code
      t.boolean :is_valid
      t.text :memo
      t.string :name
      t.string :sex
      t.date :birth
      t.string :birth_address
      t.string :marry
      t.string :tel
      t.string :phone
      t.string :qq
      t.string :fax
      t.string :email
      t.string :address
      t.string :zip
      t.text :edu_exprience
      t.text :work_exprience
      t.string :language
      t.string :language_record
      t.date :exam_date
      t.string :a_school
      t.string :a_major
      t.string :a_edu
      t.string :a_year
      t.string :b_major
      t.string :b_edu
      t.string :b_year
      t.date :begin_date
      t.string :language_type
      t.string :language_degree

      t.timestamps
    end
  end

  def self.down
    drop_table :signs
  end
end
