module Web::Views::Posts
  class Index
    include Web::View

    def post_truncate(post)
      post.length <= 500 ? post : post.slice(0, 500) + '...'
    end
  end
end
