module Web::Controllers::Posts
  class Edit
    include Web::Action

    before :authenticate!

    expose :post

    def call(params)
      @post = PostRepository.new.find(params[:id])
      redirect_to routes.root_path unless current_user_author? || current_user_admin?
    end

    private

    def current_user_author?
      current_user.id == @post.user_id
    end
  end
end
