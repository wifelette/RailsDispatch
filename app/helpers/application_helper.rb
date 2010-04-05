require "strscan"

module ApplicationHelper

  def coderay(text)
    text.gsub(/\<pre(?:\s+lang="(.+?)"(?:\s+data-caption="(.+?)")?)?\>(.+?)\<\/pre\>/m) do
      contents = $3.strip
      content_tag :div, :caption => $2, :class => "code_block" do
        CodeRay.scan(contents, $1).div(:css => :class)
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

  def weeks_or_time_ago_in_words(from_time, include_seconds = false)
    to_time   = Time.now
    weeks_ago = (to_time - from_time)/1.week
    ["this week", "last week", "two weeks ago", "three weeks ago", "four weeks ago", "one month ago", "about one month ago"][weeks_ago] || distance_of_time_in_words(from_time, Time.now, include_seconds)
  end

  def weeks_or_time_until_in_words(from_time, include_seconds = false)
    to_time   = Time.now
    weeks_ago = (from_time - to_time)/1.week
    ["next week", "in about two weeks", "in three weeks", "in four weeks", "in about a month", "upcoming"][weeks_ago] || distance_of_time_in_words(from_time, Time.now, include_seconds)
  end

end
