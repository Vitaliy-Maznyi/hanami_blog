module Web::Views::Posts
  class Show
    include Web::View

    def current_user_author?
      user_signed_in? && current_user.id == post.user.id
    end

    def current_user_commenter?(comment)
      user_signed_in? && current_user.id == comment.user.id
    end
  end
end
