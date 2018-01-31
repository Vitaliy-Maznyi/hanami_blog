class PostRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def posts_with_authors
    aggregate(:user).map_to(Post).to_a.reverse
  end

  def find_with_author(id)
    aggregate(:user).map_to(Post).where(id: id).one
  end
end
