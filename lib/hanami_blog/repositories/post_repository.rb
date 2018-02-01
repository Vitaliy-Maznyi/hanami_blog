class PostRepository < Hanami::Repository
  associations do
    belongs_to :user
    has_many :comments
  end

  def posts_with_authors
    aggregate(:user).map_to(Post).order { created_at.desc }.to_a
  end

  def find_with_author(id)
    aggregate(:user).map_to(Post).where(id: id).one
  end
end
