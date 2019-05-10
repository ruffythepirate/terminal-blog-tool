require_relative "blog_communicator"
require "test/unit"

class TestBlogCommunicator < Test::Unit::TestCase

  def set_up
    @html_service = {}
  end

  def test_lists_all_user_blogposts
    service = BlogCommunicator.new(@html_service)
    blog_posts = service.get_blog_posts

    assert_equal(1, blog_posts.count)
  end
end
