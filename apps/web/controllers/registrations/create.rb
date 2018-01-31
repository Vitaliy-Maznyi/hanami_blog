module Web::Controllers::Registrations
  class Create
    include Web::Action

    params do
      required(:user).schema do
        required(:email).filled(:str?)
        required(:first_name).filled(:str?)
        required(:last_name).filled(:str?)
        required(:password).filled(:str?, min_size?: 5).confirmation
      end
    end

    def call(params)
      if params.valid?
        create_user
        create_session
        flash[:success] = 'Congratulations! You\'ve successfully signed up!'
        redirect_to routes.root_path
      else
        flash[:errors] = params.errors[:user]
        redirect_to routes.new_registration_path(params[:user])
      end
    end

    private

    def create_user
      @user = Auth::UserCreator.new(params[:user]).call
    end

    def create_session
      session[:user_id] = @user.id
    end
  end
end
