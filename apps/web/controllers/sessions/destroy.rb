module Web::Controllers::Sessions
  class Destroy
    include Web::Action

    before :authenticate!

    def call(_)
      session[:user_id] = nil
      redirect_to routes.root_path
    end
  end
end
