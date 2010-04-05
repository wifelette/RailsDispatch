require "strscan"

module ApplicationHelper

  def coderay(text)
    text.gsub(/\<pre(?:\s+lang="(.+?)"(?:\s+data-caption="(.+?)")?)?\>(.+?)\<\/pre\>/m) do
      contents = $3.strip
      content_tag :div, :caption => $2, :class => "code_block" do
        CodeRay.scan(contents, $1).div(:css => :class).html_safe
      end
    end
  end

  # Override textilize to syntax highlight code blocks in <pre>
  def textilize(text)
    output, current = "", ""
    s = StringScanner.new(text)

    while char = s.getch
      current << char
      if s.peek(4) == "<pre"
        output << super(current)
        current = ""
        code = s.scan_until(%r{</pre>})
        output << coderay(code)
      end
    end
    output << super(current) unless current.blank?
    output
  end

  def current_post?(post)
    if slug = params[:slug]
      return true if slug == post.slug
    else
      return true if post == @body_posts.first
    end
  end

  def post_class(post)
    current_post?(post) ? "active" : "inactive"
  end

  def time_ago_in_words(from_time, include_seconds = false)
    weeks_ago = (Time.now - from_time) / 1.week
    ["this week", "last week", "two weeks ago", 
     "three weeks ago", "four weeks ago", 
     "one month ago", "about one month ago"][weeks_ago] || super
  end

end
