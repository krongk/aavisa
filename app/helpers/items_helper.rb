module ItemsHelper
  include TagsHelper

  #cut utf-8 string
  def cut(str)
    s=""
    str.each do |line|
      s << line.strip.chomp
    end

    l = s.rindex(/</)
    r = s.rindex(/>/)
    if l > r
      s = s[0...l]
    else
      s = s[0..r]
    end
    
    s = do_slice(s)
    s << "更多..."
  end

  def do_slice(s)
     lt = s.index(/</)
     gt = s.index(/>/)
    if lt and gt
      if lt > gt
        s.slice!('>')
      else
        s.slice!(lt,gt-lt)
      end
      if lt or gt
        do_slice(s)
      end
    end
    s
  end
end
