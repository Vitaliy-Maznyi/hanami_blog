module Web::Controllers::Posts
  class Update
    include Web::Action

    before :authenticate!

    params do
      required(:post).schema do
        required(:title) { filled? & str? & min_size?(3) }
        required(:body) { filled? & str? & min_size?(3) }
      end
    end

    def call(params)
      params.valid? ? update_post : render_edit
    end

    private

    def update_post
      post = PostRepository.new.update(params[:id], params[:post])
      flash[:success] = 'You\'ve successfully updated your post!'
      redirect_to routes.post_path(post.id)
    end

    def render_edit
      flash[:errors] = params.errors[:post]
      redirect_to routes.edit_post_path(params[:id])
    end
  end
end
