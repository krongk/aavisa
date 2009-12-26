class CreateBnotes < ActiveRecord::Migration
  def self.up
    create_table :bnotes do |t|
      t.string :name
      t.string :sex
      t.string :provance
      t.string :city
      t.date :birth,  :default=>'1980-1-1'
      t.string :tel
      t.string :contact_time
      t.string :fax
      t.string :email
      t.string :like_country
      t.string :relative_info
      t.string :self_info
      t.string :self_education
      t.string :self_english
      t.string :self_france
      t.string :mate_education
      t.string :mate_english
      t.string :mate_france
      t.string :asset_cash
      t.string :asset_house
      t.string :asset_bond
      t.string :asset_company
      t.date :a_started_at
      t.date :a_ended_at
      t.string :a_job
      t.string :a_revenue
      t.string :a_company_type
      t.string :a_registered_capital
      t.string :a_stock
      t.string :a_sale
      t.string :a_benefit
      t.date :b_started_at
      t.date :b_ended_at
      t.string :b_job
      t.string :b_revenue
      t.string :b_company_type
      t.string :b_registered_capital
      t.string :b_stock
      t.string :b_sale
      t.string :b_benefit
      t.text :question
      t.boolean :is_reply,  :default=>'false'
      t.boolean :is_display,  :default=>'true'
      t.string :replyer
      t.text :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :bnotes
  end
end
