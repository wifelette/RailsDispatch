module PostsHelper
  # def wrap_each_char(string, &block)
  #   string.each_char.map(&block).join
  # end
  
  # def wrap_each_char(digits)
  #   digits.split('').each do |digit|
  #     content_tag(:div, :class => 'counter_section') do
  #       content_tag(:div, digit, :class => 'counter_section_content')
  #       content_tag(:div, "", :class => 'counter_section_mask')
  #     end
  #   end
  # end
  
  def wrap_each_char(string, &block)
    return string.each_char.map(&block)
  end
  
  # <div class="counter_section">
  #   <div class="counter_section_content"><%= digit %></div>
  #   <div class="counter_section_mask"></div>
  # </div>
  
  
end