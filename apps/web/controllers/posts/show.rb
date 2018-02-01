module Web::Controllers::Posts
  class Show
    include Web::Action

    expose :post
    expose :comments

    def call(params)
      @post = PostRepository.new.find_with_author(params[:id])
      @comments = CommentRepository.new.comments_with_authors
    end
  end
end
