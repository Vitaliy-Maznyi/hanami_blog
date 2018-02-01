class CommentRepository < Hanami::Repository
  associations do
    belongs_to :user
    belongs_to :post
  end

  def comments_with_authors
    aggregate(:user).map_to(Comment).order { created_at.desc }.to_a
  end
end
