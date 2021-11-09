defimpl Phoenix.Param, for: Thedevyouknow.Posts.Blog do
  def to_param(%{slug: slug}) do
    slug
  end
end
