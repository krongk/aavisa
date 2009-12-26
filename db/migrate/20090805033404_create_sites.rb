class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :login
      t.string :password
      t.string :company_name
      t.string :site_url
      t.string :address
      t.string :phone
      t.string :fax
      t.string :email
      t.text :site_footer

      t.timestamps
    end

		Site.create(:login=>'admin',:password=>'aavisa',:company_name=>'成都亚美经济文化发展有限公司',
			:site_url=>'http://www.aa-visa.com', :address=>'成都市青羊区西大街84号金色夏威夷广场写字楼A407室',
			:phone=>'0086-28-8625-7522', :fax=>'0086-28-8625-7822',:email=>'aaec@aa-visa.com')
  end

  def self.down
    drop_table :sites
  end
end
