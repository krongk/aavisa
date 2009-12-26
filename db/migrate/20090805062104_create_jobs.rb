class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs,:id=>false do |t|
      t.integer :job_id
      t.integer :parent_id
      t.string :title
      t.string :location
      t.string :number
      t.string :experience
      t.string :language
      t.string :education
      t.string :salary
      t.text :description
      t.string :email
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end

		#add primary key
		execute "ALTER TABLE jobs CHANGE job_id job_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT"
  end

  def self.down
    drop_table :jobs
  end
end
