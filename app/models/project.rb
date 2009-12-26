class Project < ActiveRecord::Base
	has_many :items
	#acts_as_slugable :source_column => :cn_name, :target_column => :url_slug
	acts_as_nice_url :id => true, :title => :en_name
	acts_as_tree
  #validate
  validates_presence_of :parent_id,:cn_name
  #������ʾ��������
	def the_name
		if (parent_id == 0 or parent_id == nil)
			"+"+cn_name
		else
			s=cn_name
			s=parent_project(s,parent_id)
			s=s.split(">>").reverse
			s=s.join(">>")
		end
	end

	#Ƕ��ʵ����Ŀ����
	def parent_project(s,parent_id)
    if parent_id != 0 or parent_id != nil
			project = Project.find(:first, :conditions=>["id=?",parent_id])
			if project
				s= s + ">>"+ project.cn_name 
				s= parent_project(s,project.parent_id)
			end
		end
		s
	end
end
# 10 0       ��˾
# 13 10 0    ��˾-����
# 14 13 10 0 ��˾-����-����