module Web::Controllers::Posts
  class Show
    include Web::Action

    expose :post

    def call(params)
      @post = PostRepository.new.find_with_author_and_comments(params[:id])
    end
  end
end
