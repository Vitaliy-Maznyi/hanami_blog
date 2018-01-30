module Web::Controllers::Posts
  class Destroy
    include Web::Action

    before :authenticate!

    def call(params)
      PostRepository.new.delete(params[:id])
      redirect_to routes.posts_path
    end
  end
end
