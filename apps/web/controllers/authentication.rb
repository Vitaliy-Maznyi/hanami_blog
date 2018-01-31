module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        # before :authenticate! # uncomment if you want to add it to all actions
        expose :current_user
        expose :current_user_admin?
        expose :user_signed_in?
      end
    end

    private

    def authenticate!
      return true if user_signed_in?
      flash[:notice] = 'you need to sign in to do this action'
      redirect_to routes.root_path
    end

    def user_signed_in?
      !!current_user
    end

    def current_user
      @current_user ||= UserRepository.new.find(session[:user_id])
    end

    def current_user_admin?
      !!current_user&.admin
    end
  end
end
