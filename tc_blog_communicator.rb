require_relative "blog_communicator"
require_relative "model/blog_post_small"
require "test/unit"
require "mocha/test_unit"

class TestBlogCommunicator < Test::Unit::TestCase

  def setup
    @html_service = mock('html_service')
    @base_url = "my_url"
    @service = BlogCommunicator.new(@base_url, @html_service)
  end

  def test_lists_all_user_blogposts
    @html_service.expects(:get).with(@base_url + "/api/user/post-list").returns([
      create_blog_list_item(1)
    ])
    blog_posts = @service.get_blog_posts
    assert_equal(1, blog_posts.count)

    @html_service.expects(:get).with(@base_url + "/api/user/post-list").returns([
      create_blog_list_item(1),
      create_blog_list_item(2)
    ])
    blog_posts = @service.get_blog_posts

    assert_equal(
      create_blog_post_small(1),
      blog_posts[0]
    )
    assert_equal(2, blog_posts.count)
  end

  def create_blog_post_small(id)
    BlogPostSmall.new(id=id, title="title", published=true, created_at="time")
  end

  def create_blog_list_item(id)
    {"id" => id, "title" => "title", "published" => true, "created_at" => "time"}
  end
end
