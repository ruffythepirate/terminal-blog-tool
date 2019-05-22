class BlogCommunicator

  def initialize(base_url, http_service)
    @http_service = http_service
    @base_url = base_url
  end

  def get_blog_posts
    blog_items = @http_service.get(@base_url + "/api/user/post-list")

    blog_items.map { |item|  BlogPostSmall.from_hash(item)}
  end
end

