class Item < ActiveRecord::Base
	acts_as_nice_url 
	acts_as_taggable
  
	belongs_to :project

  validates_presence_of :title,:info
end
