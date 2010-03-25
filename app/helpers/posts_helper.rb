module PostsHelper
  def post_nav
    content_tag(:div) do
      "#{post.title}"
    end
  end
end
