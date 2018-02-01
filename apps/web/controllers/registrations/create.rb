require_relative './registration_params'

module Web::Controllers::Registrations
  class Create
    include Web::Action

    params RegistrationParams

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
