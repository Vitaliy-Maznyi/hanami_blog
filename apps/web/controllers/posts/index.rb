module Web::Controllers::Posts
  class Index
    include Web::Action

    expose :posts

    def call(params)
      @posts = PostRepository.new.posts_with_authors
    end
  end
end
