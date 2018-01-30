module Web::Views::Posts
  class New
    include Web::View

    def form
      Form.new(:post, routes.posts_path)
    end

    def submit_label
      'Create post'
    end
  end
end
