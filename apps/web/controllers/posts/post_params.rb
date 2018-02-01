module Web::Controllers::Posts
  class PostParams < Web::Action::Params
    params do
      required(:post).schema do
        required(:title) { filled? & str? & min_size?(3) }
        required(:body) { filled? & str? & min_size?(3) }
      end
    end
  end
end
