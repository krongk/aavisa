class Sign < ActiveRecord::Base
  validates_presence_of :name,:message=>"姓名不能为空"
  validates_presence_of :tel,:message=>"电话不能为空"
  validates_presence_of :a_school,:message=>"申请的学校名称不能为空"
end
