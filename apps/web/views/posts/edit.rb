module Web::Views::Posts
  class Edit
    include Web::View

    def form
      Form.new(:post, routes.post_path(post.id), { post: post }, { method: :patch })
    end

    def submit_label
      'Edit post'
    end
  end
end
