module Web::Controllers::Comments
  class Create
    include Web::Action

    before :authenticate!

    params do
      required(:comment).schema do
        required(:body) { filled? & str? }
        required(:post_id) { filled? & int? }
      end
    end

    def call(params)
      params.valid? ? create_comment : render_errors
      redirect_to routes.post_path(params[:comment][:post_id])
    end

    private

    def create_comment
      params[:comment][:user_id] = current_user.id
      CommentRepository.new.create(params[:comment])
      flash[:success] = 'You\'ve successfully added new comment!'
    end

    def render_errors
      flash[:errors] = params.errors[:comment]
    end
  end
end
