class BlogCommunicator

  def initialize(base_url, html_service)
    @html_service = html_service
    @base_url = base_url
  end

  def get_blog_posts
    blog_items = @html_service.get(@base_url + "/api/user/post-list")

    blog_items.map { |item|  BlogPostSmall.from_hash(item)}
  end
end

