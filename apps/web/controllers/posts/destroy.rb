module Web::Controllers::Posts
  class Destroy
    include Web::Action

    before :authenticate!

    def call(params)
      PostRepository.new.delete(params[:id])
      flash[:success] = 'You\'ve successfully removed your post!'
      redirect_to routes.posts_path
    end
  end
end
