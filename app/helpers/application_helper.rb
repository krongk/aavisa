# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper

  def title
    "aa-visa"
  end
  def title=a
    this.title=a
  end

  def yes_or_no(value)
		if value
			'是'
		else
			'否'
		end
  end
  #format data
  def format_only_no(value)
    '否' unless value
  end
  def format_date(date)
    date.strftime("%Y-%m-%d")
  end


  #validate use chinese
  def error_messages_for(object_name, options = {})
      options = options.symbolize_keys
      object = instance_variable_get("@#{object_name}")
      unless object.errors.empty?
         error_lis = []
         object.errors.each{ |key,msg| error_lis << content_tag("li", msg) }
         content_tag("div",
          content_tag(options[:header_tag] || "h2","发生了#{object.errors.count}个错误") +
          content_tag("p", "错误来源于以下原因,请参考:") +
          content_tag("ul", error_lis),
             "id" => "errorExplanation", "class" => "errorExplanation"
         )
      end
   end       
end
