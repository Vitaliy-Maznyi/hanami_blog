module Web::Controllers::Sessions
  class Destroy
    include Web::Action

    before :authenticate!

    def call(_)
      session[:user_id] = nil
      flash[:success] = 'You\'ve successfully signed out!'
      redirect_to routes.root_path
    end
  end
end
