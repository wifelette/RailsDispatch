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
  # TODO double check xss security of this
  def textilize(text)
    text = text.gsub(/<script.+script>|<script[^>]+\/>|<script/, '')
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
    output.html_safe
  end

  def current_post?(post)
    if slug = params[:slug]
      return true if slug == post.slug
    else
      return true if post == @nav_posts.first
    end
  end

  def post_class(post)
    current_post?(post) ? "active" : "inactive"
  end

  def weeks_ago_in_words(from_time, include_seconds = false)
    weeks_ago = (Time.now - from_time) / 1.week
    ["this week", "last week", "two weeks ago", 
     "three weeks ago", "four weeks ago", 
     "one month ago", "about one month ago"][weeks_ago] || super
  end
  
  # def weeks_until_in_words(from_time, include_seconds = false)
  #   to_time   = Time.now
  #   weeks_ago = (from_time - to_time)/1.week
  #   ["next week", "in about two weeks", "in three weeks", "in four weeks", "in about a month", "upcoming"][weeks_ago] || distance_of_time_in_words(from_time, Time.now, include_seconds)
  # end
  
  
  def tracking_code
    if controller.controller_name == 'posts' && controller.action_name = 'welcome'
      render 'layouts/shared/tracking_code_home'
    else
      render 'layouts/shared/tracking_code_all_pages'
    end
  end
  
  def pagination
    content_tag :div, :id => 'pagination' do
      link_to "?page=#{(params[:page].to_i + 1)}", :id => "load_more" do
        "<span>Load more</span>".html_safe
      end
    end
  end
  
  def on_posts?
    controller.controller_name == "posts"
  end
  
  def on_contributors?
    controller.controller_name == "contributors"
  end
  
  def on_community?
    controller.controller_name == "community" || controller.controller_name == "questions" || controller.controller_name == "answers"
  end
end
