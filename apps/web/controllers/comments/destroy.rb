module Web::Controllers::Comments
  class Destroy
    include Web::Action

    before :authenticate!

    def call(params)
      CommentRepository.new.delete(params[:id])
      flash[:success] = 'You\'ve successfully removed your comment!'
      redirect_to routes.post_path(params[:comment][:post_id])
    end
  end
end
