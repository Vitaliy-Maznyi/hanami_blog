require_relative './post_params'

module Web::Controllers::Posts
  class Create
    include Web::Action

    before :authenticate!

    params PostParams

    def call(params)
      params.valid? ? create_post : render_new
    end

    private

    def create_post
      params[:post][:user_id] = current_user.id
      post = PostRepository.new.create(params[:post])
      flash[:success] = 'You\'ve successfully added new post!'
      redirect_to routes.post_path(post.id)
    end

    def render_new
      flash[:errors] = params.errors[:post]
      redirect_to routes.new_post_path
    end
  end
end
