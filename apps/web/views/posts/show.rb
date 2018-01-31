module Web::Views::Posts
  class Show
    include Web::View

    def current_user_author?
      current_user.id == post.user.id
    end
  end
end
