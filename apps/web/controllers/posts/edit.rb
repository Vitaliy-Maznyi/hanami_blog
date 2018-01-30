module Web::Controllers::Posts
  class Edit
    include Web::Action

    before :authenticate!

    expose :post

    def call(params)
      @post = PostRepository.new.find(params[:id])
    end
  end
end
