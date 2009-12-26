class Anote < ActiveRecord::Base
  validates_presence_of :name,:message=>"姓名不能为空"
  validates_presence_of :tel, :message=>"联系电话不能为空"
  validates_presence_of :question,:message =>"你的提问不能为空"
end
