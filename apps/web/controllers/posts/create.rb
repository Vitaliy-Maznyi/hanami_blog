module Web::Controllers::Posts
  class Create
    include Web::Action

    before :authenticate!

    params do
      required(:post).schema do
        required(:title) { filled? & str? & size?(3..20) }
        required(:body) { filled? & str? & size?(3..400) }
      end
    end

    def call(params)
      params.valid? ? create_post : render_new
    end

    private

    def set_current_user_id

    end

    def create_post
      params[:post][:user_id] = current_user.id
      post = PostRepository.new.create(params[:post])
      redirect_to routes.post_path(post.id)
    end

    def render_new
      flash[:errors] = params.errors[:post]
      redirect_to routes.new_post_path
    end
  end
end
