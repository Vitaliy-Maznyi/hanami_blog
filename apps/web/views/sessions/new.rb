module Web::Views::Sessions
  class New
    include Web::View

    def form
      form_for :session, routes.sessions_path do
        text_field :email
        password_field :password
        submit 'Sign in'
      end
    end
  end
end
