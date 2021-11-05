defmodule Thedevyouknow.PostsTest do
  use Thedevyouknow.DataCase

  alias Thedevyouknow.Posts

  describe "blogs" do
    alias Thedevyouknow.Posts.Blog

    import Thedevyouknow.PostsFixtures

    @invalid_attrs %{}

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert Posts.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert Posts.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      valid_attrs = %{
        title: "The blog title",
        excerpt: "The blog excerpt",
        body: "<p>The blog body</p>"
      }

      assert {:ok, %Blog{} = blog} = Posts.create_blog(valid_attrs)
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      update_attrs = %{}

      assert {:ok, %Blog{} = blog} = Posts.update_blog(blog, update_attrs)
    end

    # TODO: fix this test
    @tag :skip
    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_blog(blog, @invalid_attrs)
      assert blog == Posts.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = Posts.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = Posts.change_blog(blog)
    end
  end
end
