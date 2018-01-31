module Web::Controllers::Posts
  class Edit
    include Web::Action

    before :authenticate!

    expose :post

    def call(params)
      @post = PostRepository.new.find_with_author(params[:id])
      redirect_to routes.root_path unless current_user_author? || current_user_admin?
    end

    private

    def current_user_author?
      current_user.id == post.user.id
    end
  end
end
