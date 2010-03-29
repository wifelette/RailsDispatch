module ApplicationHelper
  
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      content_tag(:div, CodeRay.scan($3, $2).div(:css => :class), :class => "CodeRay")
    end
  end
  
  def weeks_or_time_ago_in_words(from_time, include_seconds = false)
    to_time   = Time.now
    weeks_ago = (to_time - from_time)/1.week
    ["this week", "last week", "two weeks ago", "three weeks ago"][weeks_ago] || 
        distance_of_time_in_words(from_time, Time.now, include_seconds)
  end
end
