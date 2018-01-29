module Web::Views::Posts
  class New
    include Web::View

    def new_post_form
      form_for :post, routes.posts_path, values: { post: post } do
        label :title
        text_field :title
        label :body
        text_field :body
        submit 'create post'
      end
    end
  end
end
