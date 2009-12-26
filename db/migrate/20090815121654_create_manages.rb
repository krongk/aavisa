class CreateManages < ActiveRecord::Migration
  def self.up
    create_table "manages", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      
      
    end
    Manage.create(:login=>'admin',:password=>'kenrome',:email=>'kenrome@163.com')
		Manage.create(:login=>'kenrome',:password=>'0020010',:email=>'kenrome@163.com')
  end

  def self.down
    drop_table "manages"
  end
end
