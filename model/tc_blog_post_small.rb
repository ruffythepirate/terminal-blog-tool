require_relative "blog_post_small"
require "test/unit"

class TestBlogCommunicator < Test::Unit::TestCase

  def test_equals_match_on_properties
    a = BlogPostSmall.new(1, "title", true, "time")
    b = BlogPostSmall.new(1, "title", true, "time")
    c = BlogPostSmall.new(1, "title2", true, "time")

    assert_equal(a, b)
    assert_not_equal(a, c)
  end

end

