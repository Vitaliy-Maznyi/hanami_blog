module Web::Controllers::Sessions
  class Create
    include Web::Action

    params do
      required(:session).schema do
        required(:email).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    def call(params)
      user = Auth::UserFinder.new(params[:session]).call

      if user.nil?
        flash[:errors] = 'Invalid email or password'
        redirect_to routes.new_session_path
      else
        session[:user_id] = user.id
        flash[:success] = 'You\'ve successfully signed in!'
        redirect_to routes.root_path
      end
    end
  end
end
