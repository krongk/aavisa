module ProjectsHelper
  def display_categories(categories)
	   ret = "<ul>"
	   for category in categories
		   if category.parent_id == 0
				ret += "<li class='top'>"
				ret += link_to category.cn_name,:controller=>'projects',:action=>'show',:id=>category.id
				ret += find_all_subcategories(category)||""
				ret += "</li>"
		   end 
	   end
	   ret += "</ul>"
  end
    
   def find_all_subcategories(category)
    if category.children.size > 0
      ret = "<ul>"
      category.children.each { |subcat| 
        if subcat.children.size > 0
          ret += '<li>'
          ret += link_to h(subcat.cn_name),:controller=>'projects', :action => 'show', :id => subcat
          ret += find_all_subcategories(subcat)
          ret += '</li>'
        else
          ret += '<li>'
          ret += link_to h(subcat.cn_name),:controller=>'projects', :action => 'show', :id => subcat
          ret += '</li>'
        end
        }
      ret += '</ul>'
    end
  end
end
